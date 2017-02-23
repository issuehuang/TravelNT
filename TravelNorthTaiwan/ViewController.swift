//
//  ViewController.swift
//  TravelNorthTaiwan
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 VictorBasic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    var imageFromMain = ""
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var temp: UILabel!

    var degree: Int!
    var condition: String!
    var imgURL: String!
    

    
    @IBAction func openMap(_ sender: Any) {
        if imageFromMain == "九份"{
            let customURL = "comgooglemaps://?saddr=&daddr=25.109826,121.843495&zoom=10"

            UIApplication.shared.openURL(NSURL(string: customURL) as! URL)

        }else if imageFromMain == "桃園機場"{
            let customURL = "comgooglemaps://?saddr=&daddr=25.080283,121.235901&zoom=10"
            
            UIApplication.shared.openURL(NSURL(string: customURL) as! URL)

        
        }else if imageFromMain == "基隆夜市"{
            let customURL = "comgooglemaps://?saddr=&daddr=keelung+night+market&zoom=10"
            
            UIApplication.shared.openURL(NSURL(string: customURL) as! URL)
 
        
        }else if imageFromMain == "宜蘭冬山河"{
            let customURL = "comgooglemaps://?saddr=&daddr=ilan+dongshan+river+water+park&zoom=10"
            
            UIApplication.shared.openURL(NSURL(string: customURL) as! URL)

        
        }else{
            let customURL = "comgooglemaps://?saddr=&daddr=hsinchu+cheng+huang+temple+night+market&zoom=10"
            
            UIApplication.shared.openURL(NSURL(string: customURL) as! URL)

        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imageFromMain)
        detailImage.image = UIImage(named: imageFromMain)
        
        let infoAboutLocation = imageFromMain
        print(infoAboutLocation)
        
        func callJson(){
            let urlRequest = URLRequest(url: URL(string: "https://api.apixu.com/v1/current.json?key=c44db67232614977812111559172302&q=\(location.text!.replacingOccurrences(of: " ", with: "%20"))")!)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                if error == nil{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                        if let current = json["current"] as? [String : AnyObject]{
                            if let temp = current["temp_c"] as? Int{
                                self.degree = temp
  
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.temp.text = "\(self.degree.description)°"

                            
                        }
                        
                    } catch let jsonError{
                        print(jsonError.localizedDescription)
                    }
                }
                
            }
            task.resume()
            
            
        }

        
        switch infoAboutLocation {
            
        case"九份":
            
            infoLabel.text = "九份是台灣新北市瑞芳區的一個地區，早期因為盛產金礦而興盛，礦坑挖掘殆盡後從而沒落。1990年代後，因電影《悲情城市》於九份取景，九份的獨特舊式建築、坡地及風情透過此片吸引國內外的注目，也為此地區重新帶來生機，目前已經成為一個很受歡迎的觀光景點<維基百科>"
            location.text = "Taipei"
            callJson()
            
        case "桃園機場":
            
            infoLabel.text = "桃園國際機場是位於中華民國桃園市大園區的民航機場，為臺灣的國際客運樞紐，也是臺灣本島地理位置最北的機場。1979年2月26日啟用時的名稱為「中正國際機場」，2006年10月改為現名。經營機構為桃園國際機場公司。由於世界各國與臺北之間的航線大部分在桃園機場起降，其使用臺北的機場代碼，各國航空公司的航點標示亦常以「臺北機場」或「臺北桃園機場」（Taipei-Taoyuan）稱之。其與臺北市區之間有高速公路相連，聯外捷運系統亦試營運中。<維基百科>"
            location.text = "Taoyuan"
            callJson()
            
            
        case "基隆夜市":
            infoLabel.text = "據當地耆老的記錄，廟口小吃的歷史可追溯到日治時代末期。當時奠濟宮香火鼎盛，隨著眾多香客而來的流動攤販，在廟埕上聚集延伸，並逐漸擴大成為市集。<維基百科>"

            location.text = "Keelung"
            callJson()

            
            case "宜蘭冬山河":
                infoLabel.text = "冬山河親水公園位於宜蘭縣五結鄉冬山河畔，於1987年開始施工建造，1994年6月落成。親水公園主要設計理念，為結合冬山河之特性，以「親近水、擁有綠」為題，並盡量運用宜蘭傳統建材，呈現既樸拙但又不失精緻的獨創風格。<維基百科>"
            location.text = "Ilan"
            callJson()
            
            case "新竹城隍廟":
                infoLabel.text = "新竹城隍廟夜市：位在新竹城隍廟旁的知名夜市，為新竹市人氣相當高的市集景點，城隍夜市至今已有兩百多年的歷史，熱鬧的市集及古色古香的城隍建築和歷史，帶動了此區的觀光繁榮。來到夜市，當然不能錯過新竹知名的小吃及地方特色小吃：新竹貢丸、新竹米粉、潤餅、紅糟肉圓、羹湯、水蒸蛋糕…等，新竹都城隍廟廟埕的巿集小吃攤，成為新竹特色之一。"

                
            location.text = "Hsinchu"
            callJson()
        default:
            ""
            
        }
        
        
        
        
        
        
        
     //   infoLabel.text = infoAboutLocation

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    

}


//switch someCharacter {
//case "a":
//    print("The first letter of the alphabet")
//case "z":
//    print("The last letter of the alphabet")
//default:
//    print("Some other character")
//}







