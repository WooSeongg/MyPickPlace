//
//  ViewController.swift
//  MyPickPlace
//
//  Created by 미미밍 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var cate:[String] = ["치킨","한식","햄버거","한식","덮밥","돈까스","떡볶이","햄버거"]
    var name:[String] = ["노랑통닭","구내식당","맘스터치","다온","밥은화","하다식당","한끼뚝딱","오늘버거싶어"]
    var phone:[String] = ["010-5048-3825","1234567","0570-1401-7112","02-900-6364","02-902-2882","0570-1304-4698"," - ", "0570-1439-1197"]
    var juso:[String] = ["노원구 초안산로2라길 35","노원구 초안산로12","노원구 초안산로2라길 26","노원구 초안산로2라길 1","노원구 초안산로2길 123","노원구 초안산로2길 122","노원구 초안산로2길 88","노원구 초안산로2라길 3-1"]
    var open:[String] = ["16:00","09:00","10:00","10:30","11:00","11:00","11:00","11:00"]
    var close:[String] = ["02:00","19:00","22:00","22:30","20:00","21:00","21:00","21:00"]
    var latitude:[Double] = [37.63106972791317,37.62998356490629,37.62937726729589,37.63209113789929,37.63392808565744,37.63382773176819,37.63250788951244,37.63211452121395]
    var longitude:[Double] = [127.05826272850128,127.05556470124353,127.05742019176532,127.05721538954435,127.0581436761955,127.05826271699833,127.05727612869418,127.05711554954131]
    var pic = ["norang.png","induk.jpg","mom.png","da.jpg","bob.jpg","hada.jpg","han.png","today.jpg"]
    var menu:[[String]] = [["후라이드","양념치킨","깐풍치킨","순살3종세트"],["돈까스","피자돈까스","우동","치킨마요"],["싸이버거","휠렛버거","딥치즈버거","불고기버거"],["정식1","정식2","정식3","정식4"],["스팸마요","치킨마요","참치마요","직화제육"],["등심카츠","안심카츠","카레우동","카레세트"],["즉석떡볶이","치즈떡볶이","삽겹제육","김치삼겹"],["오늘버거","클래식치즈","순수버거","몬스터버거"]]
    var price = [[18000,19000,19000,24000],[4000,5000,2500,4000],[3800,3600,4000,3000],[6000,6000,6000,6000],[6000,6000,6000,6500],[9000,10000,8500,8500],[9000,11000,6000,6000],[4700,4500,4200,6800]]
    var menuPic:[[String]] = [["norang1.jpeg","norang2.jpeg","norang3.jpeg","norang4.jpeg"],["induk1","induk1","induk3","induk3"],["mom1","mom2","mom3","mom4"],["da1","da1","da1","da1"],["bob1","bob1","bob1","bob1"],["hada1","hada1","hada3","hada3"],["han1","han1","han3","han3"],["today1.jpeg","today2.jpeg","today3.jpeg","today4.jpeg"]]
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        print(name.count)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
//        cell.textLabel?.text = name[tArrayIndex] //"\(indexPath.row)"
//        //cell.detailTextLabel?.text = indexPath.description
//        tArrayIndex += 1
//        return cell
        let cell=tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! MyTableViewCell
        //var index = Int(indexPath)
        cell.txtCategory.text = cate[indexPath.row]
        cell.txtName.text = name[indexPath.row]
        cell.txtjuso.text = juso[indexPath.row]
        cell.shopimg.image = UIImage(named: pic[indexPath.row])
        //tArrayIndex = tArrayIndex>name.count ? 0:tArrayIndex+1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurantDetail = storyboard?.instantiateViewController(withIdentifier: "restaurantDetail") as! DetailViewController
        //restaurantDetail.name =  self.name[indexPath.row]
        //restaurantDetail.juso =  self.juso[indexPath.row]
        //restaurantDetail.menu =  self.menu[indexPath.row]
        restaurantDetail.myTuple = (self.name[indexPath.row],self.juso[indexPath.row],self.menu[indexPath.row],phone[indexPath.row],open[indexPath.row],close[indexPath.row],self.price[indexPath.row],self.menuPic[indexPath.row],latitude[indexPath.row],longitude[indexPath.row])
        navigationController?.pushViewController(restaurantDetail, animated: true)
    }
    
    


}

