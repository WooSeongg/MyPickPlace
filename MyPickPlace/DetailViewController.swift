//
//  DetailViewController.swift
//  MyPickPlace
//
//  Created by 미미밍 on 2022/01/20.
//

import UIKit
import MapKit
import CallKit

var locationManager:CLLocationManager!
var currentLocation:CLLocationCoordinate2D!

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var txtclose: UILabel!
    @IBOutlet weak var txtopen: UILabel!
    @IBOutlet weak var txtphone: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtjuso: UILabel!
    var myTuple:(name:String,juso:String,menu:[String],phone:String,open:String,close:String,price:[Int],menuPic:[String],latitude:Double,longitude:Double)!
    let distanceSpan: CLLocationDistance = 100
    
    @IBAction func Call(_ sender: UIButton) {
        let url = "tel://" + myTuple.phone
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp){
            UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = headerView
        txtName.text = myTuple.name
        txtjuso.text = myTuple.juso
        txtclose.text = myTuple.close
        txtopen.text = myTuple.open
        txtphone.text = myTuple.phone
        let mark = Marker(title: myTuple.name, subtitle: "", coordinate: CLLocationCoordinate2D(latitude:myTuple.latitude , longitude: myTuple.longitude))
        map.addAnnotation(mark)
        let locationLatLong = CLLocation(latitude:myTuple.8, longitude:myTuple.9)
        zoomLevel(location: locationLatLong)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTuple.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
//        cell.textLabel?.text = myTuple.2[indexPath.row] //"\(indexPath.row)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCellTableViewCell
        cell.menuPic.image = UIImage(named: myTuple.menuPic[indexPath.row])
        cell.menuTitle.text = myTuple.menu[indexPath.row]
        cell.menuPrice.text = String(myTuple.price[indexPath.row])+"원"
        return cell
    }
    
    func zoomLevel(location: CLLocation){
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        map.setRegion(mapCoordinates, animated:true)
    }
    
    class Marker:NSObject, MKAnnotation{
        let title:String?
        let coordinate: CLLocationCoordinate2D
        let subtitle: String?
        
        init(title:String?, subtitle:String?, coordinate:CLLocationCoordinate2D){
            self.title = title
            self.subtitle = subtitle
            self.coordinate = coordinate
            
            super.init()
        }
    }
    

}
