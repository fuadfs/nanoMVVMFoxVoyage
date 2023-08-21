//
//  AddphotoView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 25/07/23.
//
import SwiftUI
import AVFoundation

struct AddphotoView: View {
    var body: some View {
        CameraView()
    }
}

struct CameraView: View{
    
    @EnvironmentObject var router: Router
    @StateObject var camera = CameraModel()
    
    var body: some View{
        
        ZStack{
            
            //to be camera preview
            CameraPreview(camera: camera)
                .frame(width: 358, height: 568)
                .cornerRadius(30)
                .padding(.bottom, 40)
            
            // Button to toggle between front and rear camera
            Button(action: {
                camera.toggleCamera()
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.camera")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
            }
            VStack{
                
                if camera.isTaken{
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: camera.reTake, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("Black900"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                    }
                    
                }
                
                
                Spacer()
                
                HStack{
                    
                    //if taken showing save and again take button
                    if camera.isTaken{
                        VStack{
                            ZStack{
                                Rectangle()
                                    .frame(width: 154, height: 48)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                
                                Text("􀎪 Coastarina")
                                    .font(.custom("SFProText-Medium", size: 15))
                                    .foregroundColor(Color("Black900"))
                                
                            }.padding(.top, -120)
                            Button{
                                
                                if !camera.isSaved{
                                    camera.savePic()
                                    
                                    router.push(.addPhoto(picData: camera.picData))
                                }
                                
                                
                            }label: {
                                Text("Preserved This Moment 􀄯")
                                    .font(.custom("SFProText-Medium", size: 17))
                                    .foregroundColor(Color.white)
                                    .frame(width: 358, height: 64)
                                    .background(Color("Redish400"))
                                    .clipShape(Capsule())
                            }
                        }
                    }else{
                        
                        Button(action: camera.takePic, label: {
                            
                            ZStack{
                                
                                Circle()
                                    .fill(Color("Black900"))
                                    .frame(width: 54, height: 54)
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 6)
                                    .frame(width: 64, height: 64)
                                
                            }.padding(.bottom, 30)
                            
                            
                        })
                        
                    }
                }.frame(height: 75)
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Black900"))
        
        
            .onAppear(perform: {
                
                camera.Check()
                
            })
    }
}

//cemara model
class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    //since were going to read pic data
    @Published var output = AVCapturePhotoOutput()
    
    //preview
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    //pic data
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    
    
    @Published var currentCameraPosition: AVCaptureDevice.Position = .back
    
    func Check(){
        
        //first checkin camera has got permission
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case.authorized:
            setUp()
            return
            //setting up session
        case .notDetermined:
            //retusting for permission
            AVCaptureDevice.requestAccess(for: .video){ (status) in
                
                if status{
                    self.setUp()
                }
            }
        case.denied:
            self.alert.toggle()
            return
            
        default:
            return
        }
    }
    
    func setUp(){
        
        //setting up camera
        do{
            
            //setting config
            self.session.beginConfiguration()
            
            //our own
            if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back){
                
                let input = try AVCaptureDeviceInput(device: device)
                
                //checking and adding to session
                if self.session.canAddInput(input){
                    self.session.addInput(input)
                }
                
                
                
                //same for output
                if self.session.canAddOutput(self.output){
                    self.session.addOutput(self.output)
                }
                
                self.session.commitConfiguration()
                
            }
            else {
                // Handle the case when the device is nil (camera not available)
                print("Camera device not available.")
            }
            
        }
        catch{
            print(error.localizedDescription)
        }
    }
    //take and retake function
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            // Tambahkan penundaan (misalnya 1 detik) sebelum menghentikan sesi kamera
            Thread.sleep(forTimeInterval: 1.0)
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation { self.isTaken.toggle() }
            }
        }
    }
    
    func reTake(){
        
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                //clearing
                self.isSaved = false
                
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }
        
        print("Pic taken...")
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error: Unable to get image data representation.")
            return
        }
        
        self.picData = imageData
        
    }
    
    func savePic() {
        DispatchQueue.global(qos: .userInitiated).async {
            guard !self.picData.isEmpty else {
                print("Error: picData is empty.")
                return
            }
            
            if let image = UIImage(data: self.picData) {
                // Saving image
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.imageSaved(_:didFinishSavingWithError:contextInfo:)), nil)
                
            } else {
                print("Error: Unable to create UIImage from picData.")
            }
        }
        
    }
    
    @objc private func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeMutableRawPointer?) {
        DispatchQueue.main.async {
            if let error = error {
                print("Error saving image: \(error.localizedDescription)")
            } else {
                print("Image saved successfully.")
                self.isSaved = true
            }
        }
    }
    
    func toggleCamera() {
        // First, remove the current input
        for input in session.inputs {
            session.removeInput(input)
        }
        
        // Next, switch between front and rear camera
        currentCameraPosition = (currentCameraPosition == .back) ? .front : .back
        
        // Get the new camera device
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: currentCameraPosition) {
            do {
                // Create a new input with the new device
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    // Add the new input to the session
                    session.addInput(input)
                } else {
                    print("Failed to add input to session")
                }
            } catch {
                print("Error creating device input: \(error)")
            }
        } else {
            print("Failed to get the camera device")
        }
    }
    
}
//setting view for preview
struct CameraPreview: UIViewRepresentable{
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) ->  UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        //own properties
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        
        //starting session
        // Start the camera session on a background thread
        DispatchQueue.global(qos: .userInitiated).async {
            camera.session.startRunning()
        }
        
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
