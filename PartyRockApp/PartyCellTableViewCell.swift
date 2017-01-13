//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Kimar Arakaki Neves on 2016-11-19.
//  Copyright © 2016 Kimar. All rights reserved.
//

import UIKit

class PartyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateIU(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle error
            }
        }
    }
}
