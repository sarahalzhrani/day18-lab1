//
//  CustomTableViewCell.swift
//  Contact
//
//  Created by sara al zhrani on 13/03/1443 AH.
//
import UIKit
struct Arr {
  let name: String
  let image: String
}
let ar = [Arr(name: "Amal", image: "pic1"),
     Arr(name: "Sally", image: "pic1"),
     Arr(name: "Hanan", image: "pic1"),
     Arr(name: "Munirah", image: "pic1"),
     Arr(name: "Fatiamh", image: "pic1"),
     Arr(name: "Kholod", image: "pic1"),
     Arr(name: "Maram", image: "pic1"),
     Arr(name: "Tasneem", image: "pic1"),
     Arr(name: "Atheer", image:"pic1"),
     Arr(name: "Afnan", image: "pic1")]
class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
 override func viewDidLoad() {
  super.viewDidLoad()
   //table
  let tabelView = UITableView()
  tabelView.dataSource = self
  tabelView.delegate = self
  tabelView.register(Cell.self, forCellReuseIdentifier: "cell")
  tabelView.backgroundColor = .white
  tabelView.rowHeight = 80
  tabelView.translatesAutoresizingMaskIntoConstraints = false
   //add table to view
  view.addSubview(tabelView)
   //constraint
  NSLayoutConstraint.activate([tabelView.leftAnchor.constraint(equalTo: view.leftAnchor),
         tabelView.rightAnchor.constraint(equalTo: view.rightAnchor),
         tabelView.topAnchor.constraint(equalTo: view.topAnchor),
         tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
 }
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return ar.count
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let r = ar[indexPath.row]
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
   cell.imagecell.image = UIImage(named: r.image)
   cell.namecell.text = r.name
   cell.imagecell.layer.masksToBounds = true
   cell.imagecell.layer.cornerRadius = 40
   return cell
 }
}
 //cell class
 class Cell: UITableViewCell {
  let imagecell = UIImageView()
  let namecell = UILabel()
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
  super.init(style: style , reuseIdentifier: reuseIdentifier )
   imagecell.translatesAutoresizingMaskIntoConstraints = false
//   imagecell.image = UIImage(named: “p1-1”)
   self.addSubview(imagecell)
   NSLayoutConstraint.activate([imagecell.rightAnchor.constraint(equalTo: rightAnchor),
   imagecell.heightAnchor.constraint(equalToConstant: 80),
   imagecell.widthAnchor.constraint(equalTo: imagecell.heightAnchor,multiplier: 100/100)])
   namecell.text = "kkk"
   namecell.translatesAutoresizingMaskIntoConstraints = false
   self.addSubview(namecell)
   NSLayoutConstraint.activate(
   [namecell.centerYAnchor.constraint(equalTo: centerYAnchor),
   namecell.leftAnchor.constraint(equalTo: imagecell.leftAnchor , constant: -80),
   namecell.heightAnchor.constraint(equalToConstant: 80),
   namecell.trailingAnchor.constraint(equalTo: trailingAnchor , constant: 100)])
 }
 required init?(coder: NSCoder) {
  super.init(coder: coder)
 }
 }
