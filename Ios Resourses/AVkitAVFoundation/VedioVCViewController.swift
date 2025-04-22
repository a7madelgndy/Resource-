//
//  VedioVCViewController.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 22/04/2025.
//


import AVKit

class VedioVCViewController: UIViewController {
    
    var playerViewController: AVPlayerViewController?
    let videoContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadAndPlayVideo(from: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
    }
    
    func downloadAndPlayVideo(from urlString: String) {
    
        
        guard let url = URL(string: urlString) else { return }
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player

        self.addChild(playerController)
        videoContainer.addSubview(playerController.view)
        playerController.didMove(toParent: self)

        view.addSubview(playerController.view)
        playerController.view.setConstrains(top: view.topAnchor , leading:  view.leadingAnchor , trailing:  view.trailingAnchor )

        playerController.videoGravity = .resizeAspectFill
        
        
        playerController.view.heightAnchor.constraint(equalToConstant: 200).isActive = true

    }
    
 
}

#Preview {
    VedioVCViewController()
}

extension VedioVCViewController : AVPlayerViewControllerDelegate {
    func playerViewController(_ playerViewController: AVPlayerViewController, willBeginFullScreenPresentationWithAnimationCoordinator coordinator: any UIViewControllerTransitionCoordinator) {
        
    }
}
