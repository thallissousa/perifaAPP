//
//  DiscoverViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var discoverCollectionView: UICollectionView!
    let imagemDosEstabelecimentos = ["tile",
                            "tile blue",
                            "boteco",
                            "toninho",
                            "tabacaria"]
    let titles = ["serase foi?",
                  "Adega altas horas",
                  "Boteco do Simas",
                  "Como alguém fez pacto e é um fudido",
                  "Tabacaria Altas Horas"]
    let endereco = ["Rua Massaranduba, 301 - Apartamento 105",
                    "Rua biruleibe, n.823",
                    "Rua patatipassaozap, 230",
                    "Rua hiroshima nagazap, 4999",
                    "Avenida kirinha da Silva, n.123"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagemDosEstabelecimentos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        cell.imagens.image = UIImage(named: imagemDosEstabelecimentos[indexPath.row])
        cell.pTitle.text = titles[indexPath.row]
        cell.pAuthor.text = endereco[indexPath.row]
        return cell
        
    }
    
    //passar os conteúdos entre as páginas
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as?
            DetailViewController {
            vc.imagemDosEstabelecimentos = imagemDosEstabelecimentos
            vc.titles = titles
            vc.endereco = endereco
            vc.detail = indexPath.item
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageConfigs()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
        
        
        
    }
    
    
    func pageConfigs() {
        view.backgroundColor = .systemGray6
        
        title = "Descubra"

        //configuração da navigationBar quando Scrollada
        navigationController?.navigationBar.tintColor = .systemOrange
        
        let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
    }
    



class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var imagens: UIImageView!
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pAuthor: UILabel!
    
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 8
        imagens.layer.cornerRadius = 8
        
        //        translatesAutoresizingMaskIntoConstraints = false
        //        background.widthAnchor.constraint(equalToConstant: 400).isActive = true
        //        background.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //        background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        //        background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        //        background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
    }
    
    
}

extension UIApplication {

var statusBarView: UIView? {
    return value(forKey: "statusBar") as? UIView
   }
}
