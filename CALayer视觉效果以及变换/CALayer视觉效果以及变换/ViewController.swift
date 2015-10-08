//
//  ViewController.swift
//  CALayer视觉效果以及变换
//
//  Created by 袁昊 on 15/10/8.
//  Copyright © 2015年 squallomuse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var view1:UIView!;
    var view2:UIView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor();
        self.createTwoView();
        self.test();
        self.test2();
//        self.test3();
        self.test4();
    }
//给UIView加上圆角和边框
    func test(){
//        超出俯视图不显示，类似UIView的clipsToBounds
        self.view1.layer.masksToBounds = true;
//        设置圆角
        self.view1.layer.cornerRadius = self.view1.frame.size.width/2;
//        边框的宽度和颜色
        self.view1.layer.borderWidth = 2;
        self.view1.layer.borderColor = UIColor.blackColor().CGColor;
    }
    
//    阴影
    func test2(){
//        设置阴影的透明度 0~1.0
        self.view1.layer.shadowOpacity = 0.9;
//        阴影的颜色
        view1.layer.shadowColor = UIColor.redColor().CGColor;
//        shadowOffset: CGSize :宽度控制这阴影横向的位移，高度控制着纵向的位移。
//        shadowOffset的默认值是 {0, -3}，意即阴影相对于Y轴有3个点的向上位移
        view1.layer.shadowOffset = CGSizeMake(0, 3);
//        shadowRadius: 控制着阴影的模糊度，当它的值是0的时候，阴影就和视图一样有一个非常确定的边界线。当值越来越大的时候，边界线看上去就会越来越模糊和自然
        self.view1.layer.shadowRadius = 10;
//        self.view1.layer.masksToBounds = false;
    }
    
    
    
    func createTwoView(){
        self.view1 = UIView(frame: CGRectMake(0, 0, 200, 200));
//        self.view.addSubview(self.view1);
        self.view1.layer.contents = UIImage(named: "1.jpg")?.CGImage;
        view2 = UIView(frame: CGRectMake(80, 150, 200, 200));
        self.view.addSubview(view2);
        self.view2.addSubview(view1);
}
//    圆形图片的阴影
    func test3(){
            self.view2.layer.shadowOpacity = 0.9;
            view2.layer.shadowOffset = CGSizeMake(0, 5);
            self.view2.layer.shadowRadius = 10;
    }
//  自定义阴影
    func test4(){
        self.view2.layer.shadowOpacity = 0.8;
        let path = CGPathCreateMutable();
               CGPathAddArc(path, nil, 200, 200, 20, 0, CGFloat(M_PI*2), true);
        self.view2.layer.shadowPath = path;

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

