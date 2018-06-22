//
//  AppDelegate.swift
//  Kids AR
//
//  Created by deemsys on 17/05/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import UIKit
import StoreKit
import  AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var application: UIApplication?
    
    var isUnityRunning = false
    
    var pausePlaying = false
    
    @objc var currentUnityController: UnityAppController!
    
    let productIDs:Array<String> = ["com.deemsysinc.kidsar.basicmodels","com.deemsysinc.kidsar.premiummodel"]
    var productsArray: Array<SKProduct?> = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 1))
        
        self.application = application
        unity_init(CommandLine.argc, CommandLine.unsafeArgv)
        
        currentUnityController = UnityAppController()
        currentUnityController.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // first call to startUnity will do some init stuff, so just call it here and directly stop it again
        startUnity()
        stopUnity()
        
        if UserDefaults.standard.object(forKey: "isMusicOn") == nil{
           UserDefaults.standard.set(true, forKey: "isMusicOn")
           UserDefaults.standard.set(false, forKey: "instructionsShowed")
           UserDefaults.standard.set(0, forKey: "rateus")
        }
        if UserDefaults.standard.object(forKey: "KidName") == nil{
            UserDefaults.standard.set("", forKey: "KidName")
        }
        
        if UserDefaults.standard.value(forKey: "KidName") as! String == "" {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
            let navigationController = UINavigationController(rootViewController: vc)
          navigationController.setNavigationBarHidden(true, animated: false)
            self.window!.rootViewController = navigationController
            self.window!.makeKeyAndVisible()
            
        }else{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeViewController") as! welcomeViewController
            let navigationController = UINavigationController(rootViewController: vc)
             navigationController.setNavigationBarHidden(true, animated: false)
            self.window!.rootViewController = navigationController
            self.window!.makeKeyAndVisible()
        }
        for id in productIDs{
            let status = UserDefaults.standard.bool(forKey: (id))
            if !status{
              // TEMPORARY PURCCHASE
              //  UserDefaults.standard.set(true, forKey: id)
                UserDefaults.standard.set(false, forKey: id)
            }
        }
        UserDefaults.standard.synchronize()
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        self.pauseSound()
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application)
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        self.pauseSound()
        
        if isUnityRunning {
            currentUnityController.applicationDidEnterBackground(application)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        self.playSound()
        
        if isUnityRunning {
            currentUnityController.applicationWillEnterForeground(application)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        self.playSound()
        
        if isUnityRunning {
            currentUnityController.applicationDidBecomeActive(application)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        self.stopSound()
        
        if isUnityRunning {
            currentUnityController.applicationWillTerminate(application)
        }
    }
    func startUnity() {
        if !isUnityRunning {
            isUnityRunning = true
            currentUnityController.applicationDidBecomeActive(application!)
        }
    }
    
    func stopUnity() {
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application!)
            isUnityRunning = false
        }
    }

    var player: AVAudioPlayer?
    
    public func playSound() {
        
        let music =   UserDefaults.standard.value(forKey: "isMusicOn") as! Bool
        if music == false{
            return
        }
        if pausePlaying == true{
            return
        }
        if player != nil && player?.isPlaying == false{
//            let shortStartDelay = 0.01;            // seconds
//            let now = player?.deviceCurrentTime;
//            player?.play(atTime: now! + shortStartDelay)
            
            player?.play()
            
            return
        }
        else if player != nil && player?.isPlaying == true{
            return
        }
        guard let url = Bundle.main.url(forResource: "slowbackgroundmusic", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.numberOfLoops = -1
            player.volume = 1.0
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func pauseSound(){
        if player == nil{
            return
        }
        if player?.isPlaying == true{
            player?.pause()
        }
    }
    
    public func stopSound(){
        if player != nil{
            player?.stop()
            player?.currentTime = 0
            player = nil
        }
    }
}

