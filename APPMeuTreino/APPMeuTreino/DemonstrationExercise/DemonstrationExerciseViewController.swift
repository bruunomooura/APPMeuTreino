//
//  DemonstrationExerciseViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit
import YouTubePlayer

class DemonstrationExerciseViewController: UIViewController, YouTubePlayerDelegate {

    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var demonstrationVideoPlayer: YouTubePlayerView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
   
    @IBOutlet weak var playerImageView: UIImageView!
    
    var exercise: Exercise?
    var exerciseService: ExerciseServiceProtocol = GetExerciseService()
   
    override func viewDidLoad() {
            super.viewDidLoad()
            
            demonstrationVideoPlayer.delegate = self
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapVideoPlayer))
            demonstrationVideoPlayer.addGestureRecognizer(tapGesture)
            
            updateUI()
        }
        
        func updateUI() {
            exerciseLabel.text = exercise?.exerciseName
            
            guard let videoURLString = exercise?.exerciseVideoURL, let videoURL = URL(string: videoURLString) else {
                return
            }
            
            demonstrationVideoPlayer.loadVideoURL(videoURL)
        }
        
        @objc func didTapVideoPlayer() {
            if demonstrationVideoPlayer.ready {
                if demonstrationVideoPlayer.playerState == YouTubePlayerState.Playing {
                    playerImageView.isHidden = false
                    demonstrationVideoPlayer.pause()
                } else {
                    playerImageView.isHidden = true
                    demonstrationVideoPlayer.play()
                }
            }
        }
        
        @IBAction func tappedBackButton(_ sender: UIButton) {
            dismiss(animated: true)
        }
        
        // MARK: - YouTubePlayerDelegate
        
        func playerReady(_ videoPlayer: YouTubePlayerView) {
            // Opcional: Implemente este método se você precisar executar alguma lógica quando o player estiver pronto
        }
        
        func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
            // Opcional: Implemente este método se você precisar executar alguma lógica quando o estado do player for alterado
        }
        
        func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
            // Opcional: Implemente este método se você precisar executar alguma lógica quando a qualidade do vídeo for alterada
        }
    }
