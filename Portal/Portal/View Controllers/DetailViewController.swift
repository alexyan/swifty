//
//  DetailViewController.swift
//  swifty
//
//  Created by 想当当 on 14-6-9.
//  Copyright (c) 2014年 想当当. All rights reserved.
//

import UIKit

class DetailViewController: BaseMUIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {

    
    var tableView: MUITableView?
    var cellIndentifier = "cellIndentifier"
    var itemArray = [
        ["title":"手机AAA","section":"0"],
        ["title":"手机BBB","section":"1"]
    ]

    
    override func viewDidLoad() {
        
    
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    
        //self.view!.backgroundColor = UIColor.whiteColor()
        
        NSLog(self.title)
        
        if(self.title == "UIImageView"){
            var image     = UIImage(named: "swift-hero.png")
            var imageView = UIImageView(frame: CGRectMake((CGRectGetWidth(self.view.bounds) - image.size.width) / 2.0, 120.0, image.size.width, image.size.height))
            imageView.image = image
            self.view.addSubview(imageView)
        }else if(self.title == "UISlider"){
            var slider = UISlider(frame:CGRectMake(60.0, 120.0, 200.0, 30.0))
            self.view.addSubview(slider)
        }else if(self.title == "UIWebView"){
            var webView = UIWebView(frame:self.view.bounds)
            var url = NSURL(string: "http://caipiao.m.taobao.com")
            var request = NSURLRequest(URL: url)
            webView.loadRequest(request)
            self.view.addSubview(webView)
        }else if(self.title == "UISegmentedControl"){
            var segmentControl = UISegmentedControl(items:["A", "B", "C", "D"])
            segmentControl.frame = CGRectMake(110.0, 120.0, 100.0, 30.0)
            self.view.addSubview(segmentControl)
        }else if(self.title == "UISwitch"){
            var switchControl = UISwitch(frame:CGRectMake(130.0, 120.0, 100.0, 30.0))
            switchControl.on = true
            self.view.addSubview(switchControl)
        }else if(self.title == "UIScrollView"){
            var scrollView = UIScrollView(frame:CGRectMake(60.0, 120.0, 200.0, 200.0))
            scrollView.pagingEnabled = true
            scrollView.showsVerticalScrollIndicator = false
            self.view.addSubview(scrollView)
            
            var fX: CGFloat = 0.0
            for(var i = 0; i < 3; ++i)
            {
                var view = UIView(frame:CGRectMake(fX, 0.0, 200.0, 200.0))
                fX += 200.0
                view.backgroundColor = UIColor.redColor()
                scrollView.addSubview(view)
            }
            scrollView.contentSize = CGSizeMake(3 * 200.0, 200.0)
            self.view.addSubview(scrollView)
        }else if(self.title == "UISearchBar"){
            var searchBar = UISearchBar(frame:CGRectMake(10.0, 120.0, 300.0, 30.0))
            searchBar.showsCancelButton = true
            searchBar.searchBarStyle = UISearchBarStyle.Minimal // Default, Prominent, Minimal
            
            self.view.addSubview(searchBar)
        }else if(self.title == "UIPageControl"){
            // PageControl
            var pageControl = UIPageControl(frame:CGRectMake(60.0, 120.0, 200.0, 200.0))
            pageControl.numberOfPages = 5
            pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
            pageControl.pageIndicatorTintColor = UIColor.redColor()
            self.view.addSubview(pageControl)
        }else if(self.title == "UIDatePicker"){
            var datePicker = UIDatePicker(frame:CGRectMake(0.0, 120.0, 200.0, 200.0))
            self.view.addSubview(datePicker)
        }
        else if(self.title == "UIPickerView"){
            var pickerView = UIPickerView(frame:CGRectMake(10.0, 120.0, 300.0, 200.0))
            pickerView.delegate = self
            pickerView.dataSource = self
            self.view.addSubview(pickerView)
        }else if(self.title == "UIProgressView"){
            var progressView = UIProgressView(progressViewStyle:UIProgressViewStyle.Default)
            progressView.frame = CGRectMake(10.0, 120.0, 300.0, 30.0)
            progressView.setProgress(0.8, animated: true)
            self.view.addSubview(progressView)
        }else if(self.title == "UITextView"){
            var textView = UITextView(frame:CGRectMake(10.0, 120.0, 300.0, 200.0))
            textView.backgroundColor = UIColor.lightGrayColor()
            textView.editable = false
            textView.font = UIFont.systemFontOfSize(20)
            textView.text = "Swift is an innovative new programming language for Cocoa and Cocoa Touch. Writing code is interactive and fun, the syntax is concise yet expressive, and apps run lightning-fast. Swift is ready for your next iOS and OS X project — or for addition into your current app — because Swift code works side-by-side with Objective-C."
            self.view.addSubview(textView)
        }else if(self.title == "UIToolbar"){
            var toolBar = UIToolbar(frame:CGRectMake(60.0, 120.0, 200.0, 30.0))
            
            var flexibleSpace = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target:nil, action:nil)
            var barBtnItemA = UIBarButtonItem(title: "A", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemB = UIBarButtonItem(title: "B", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemC = UIBarButtonItem(title: "C", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemD = UIBarButtonItem(title: "D", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            
            toolBar.items = [flexibleSpace, barBtnItemA, flexibleSpace, barBtnItemB, flexibleSpace, barBtnItemC, flexibleSpace, barBtnItemD, flexibleSpace]
            self.view.addSubview(toolBar)
        }else if(self.title == "UIActionSheet"){
            // Button
            var button = UIButton.buttonWithType(UIButtonType.System) as? UIButton
            button!.frame = CGRectMake(60.0, 120.0, 200.0, 50.0)
            button!.backgroundColor = UIColor.grayColor()
            button?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            button!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
            button?.setTitle("Show ActionSheet", forState: UIControlState.Normal)
            button?.setTitle("Show ActionSheet", forState: UIControlState.Highlighted)
            button?.addTarget(self, action: "showActionSheet", forControlEvents: UIControlEvents.TouchUpInside)
            button!.tag = 101
            self.view.addSubview(button)
        }else if(self.title == "UIActivityIndicatorView"){
            var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
            activityIndicatorView.frame = CGRectMake(140.0, 120.0, 40.0, 40.0)
            activityIndicatorView.startAnimating()
            self.view.addSubview(activityIndicatorView)
        }else if(self.title == "MUIButton"){
            var button1:MUIButton? = MUIButton(frame:CGRectMake(10.0, 200.0, 300.0, 50.0))
            button1!.addTarget(self, action: "touchDown", forControlEvents: UIControlEvents.TouchDown)
            button1!.font = UIFont(name:"Helvetica",size:24)
            button1!.setTitle("OK",forState: UIControlState.Normal)
            button1!.setTitle("OK", forState: UIControlState.Highlighted)
            self.view.addSubview(button1!)
        }else if(self.title == "MUITextFieldWithLabelView"){
            println("Goto MUITextFieldWithLabelView")
            var textFieldWithLabel = MUITextFieldWithLabelView(frame:CGRectMake(10.0, 70.0, 300.0, 40.0))
            textFieldWithLabel.label.text = "手机"
            self.view.addSubview(textFieldWithLabel)
            var textFieldWithLabel1 = MUITextFieldWithLabelView(frame:CGRectMake(10.0, 120.0, 300.0, 40.0))
            textFieldWithLabel1.label.text = "手机号码"
            self.view.addSubview(textFieldWithLabel1)
            
        }else if(self.title == "MUIFormView"){
            //println("MUIFormView")
            //如果使用UITableView做Form,最好设置style:UITableViewStyle.Grouped
            //self.tableView = MUITableView(frame:self.view.frame, style:UITableViewStyle.Grouped)
            self.tableView = MUITableView(frame:CGRect(x:0.0,y:40.0,width:320.0,height:80.0), style:UITableViewStyle.Grouped)
            self.tableView!.registerClass(MUITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
            self.tableView!.delegate = self
            self.tableView!.dataSource = self
            //self.tableView!.separatorStyle  = UITableViewCellSeparatorStyle.None
            self.tableView!.separatorInset = UIEdgeInsetsZero
            //self.tableView!.userInteractionEnabled = false
            self.tableView!.scrollEnabled = false
            self.view?.addSubview(self.tableView)
            

            //println(self.navigationController.navigationBar.frame)
            //CGRect frame = self.tableView.frame;
            //frame.size.height = self.tableView.contentSize.height;
            //self.tableView.frame = frame;
            
            
        }else if(self.title == "MUILabelWithIconFont"){
            //http://ued.alimama.com/posts/964
            let label = MUILabel(frame:self.view.bounds)
            let iconfont = UIFont(name:"rei",size:34)
            label.font = iconfont
            label.textColor = UIColor(hex:0xff6600)
            label.textAlignment = NSTextAlignment.Center
            label.text = "\U0000F001"
            self.view.addSubview(label)
        }else{
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    override func viewDidAppear(animated: Bool) {}
    override func viewWillDisappear(animated: Bool) {}
    override func viewDidDisappear(animated: Bool) {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // Button Action
    func buttonAction(sender: UIButton)
    {
        // Swfit -> ObjC

        //var mathSum = MathSum()
        //var sum = mathSum.sum(11, number2: 22)
//
//        var alert = UIAlertController(title: "Title", message: String(format: "Result = %i", sum), preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        self.presentViewController(alert, animated: true, completion: nil)

        
        /*
        var alertView = UIAlertView()
        alertView.title = "Title"
        alertView.message = "Message"
        alertView.addButtonWithTitle("OK")
        alertView.show()
        */
        
    }
    
    // UIPickerViewDataSource Methods
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int
    {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return String(format:"%i", row)
    }
    
    // Button Handler
    // showActionSheet
    func showActionSheet()
    {
        var alertController = UIAlertController(title: "ActionSheet", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: "Go Back", style: UIAlertActionStyle.Destructive, handler: nil))
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    func touchDown(){
        NSLog("touchDown")
    }
    
    
    // UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 2
    }
    

    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch(section){
            case 0:
                count = self.itemArray.count
                break
            default:
                count = 0
                break
        }
        return count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath: indexPath) as MUITableViewCell!
        
        //remove the arrow
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        switch(indexPath.section){
            case 0:
                for (item) in self.itemArray[indexPath.row] {
                    //if(indexPath.section == self.itemArray[indexPath.row]["section"]!){
                    var contentView = MUITextFieldWithLabelView(frame:cell.contentView.frame)
                    contentView.label.text = self.itemArray[indexPath.row]["title"]
                    cell.contentView.insertSubview(contentView, atIndex:0)
                    //}
            
                }
                //tableView自适应的高度在MUITableView内使用autolayout做了处理
                self.tableView!.frame.size.height = self.tableView!.contentSize.height + 64
                break
            
            case 1:

                break
            
            default:
                break
        }


        return cell

        
    }
    
    func tableView(tableView: MUITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 40.0
    }
    
    
    func tableView(tableView: MUITableView!, titleForHeaderInSection section: Int) -> String! {
        var title = ""
        switch(section){
        case 0:
            title = "手机"
            break
        default:
            break
        }
        return title

    }
    
    override func updateViewConstraints() {
        println("DetailViewController === > updateViewConstraints")
        super.updateViewConstraints()
        //println("updateViewConstraints")
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        //println("====>")
        //println(self.navigationController.navigationBar.frame.size.height)
        //self.tableView!.frame = CGRect(x:0.0,y:self.navigationController.navigationBar.frame.size.height,width:self.view.frame.size.width,height:self.view.frame.size.height)
    }
    
}
