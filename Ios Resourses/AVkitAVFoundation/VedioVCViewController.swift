//
//  VedioVCViewController.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 22/04/2025.
//


import AVKit
import UIKit

class VedioVCViewController: UIViewController {
   
        let videoContainer = UIView()
        var playerViewController: AVPlayerViewController?

        override func viewDidLoad() {
            super.viewDidLoad()
            setupVideoContainer()
            loadPlayer()
        }



        private func loadPlayer() {
            guard let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }

            let player = AVPlayer(url: url)
        
            let controller = AVPlayerViewController()
            controller.player = player
            controller.showsPlaybackControls = false
            controller.videoGravity = .resizeAspect

            addChild(controller)
            videoContainer.addSubview(controller.view)
            controller.didMove(toParent: self)

            controller.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                controller.view.topAnchor.constraint(equalTo: videoContainer.topAnchor),
                controller.view.leadingAnchor.constraint(equalTo: videoContainer.leadingAnchor),
                controller.view.trailingAnchor.constraint(equalTo: videoContainer.trailingAnchor),
                controller.view.bottomAnchor.constraint(equalTo: videoContainer.bottomAnchor)
            ])

            // Save reference for tap
            self.playerViewController = controller

            player.play()
            player.isMuted = true
        

       
      
        }

        @objc private func openFullScreen() {
            guard let controller = playerViewController else { return }
            present(controller, animated: true) {
                controller.player?.play()
            }
        }
    }
#Preview {
    VedioVCViewController()
}

extension VedioVCViewController {
    private func setupVideoContainer() {
        videoContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(videoContainer)

        NSLayoutConstraint.activate([
            videoContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            videoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            videoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            videoContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
