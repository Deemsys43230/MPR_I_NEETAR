//
//  model.swift
//  NEET AR 11 BIO PHASE 1
//
//  Created by deemsys on 15/03/18.
//  Copyright © 2018 deemsys. All rights reserved.
//

import Foundation
import SceneKit

class model:NSObject
{
    var id = 0
    var visiblename = ""
    var modelname = ""
    var modelpath = ""
    var staticmodelname = ""
    var staticmodelpath = ""
    var modelimage = ""
    var isLighteningEnabled:Bool = true
    var isSurfaceEnabled:Bool =  false
    var isZoomEnabled:Bool =  false
    var isPartsAvailable:Bool =  false
    var canModifySurface:Bool =  false
    var relatedids:[Int] = []
    var hints:[String] = []
    var childModels:[model] = [] {
        
        didSet{
            if self.childModels.count>0{
                showMenus = true
            }
            else{
                showMenus = false
            }
        }
        
    }
    
    var partsname = ""
    var partsmodelpath = ""
    var showParts:Bool =  false
    var showMenus:Bool =  false
    var isAnimatable = false
    var modelAnimatedpath = ""
    var animationIdentifier:String = ""
    var scaleValue:Float = 0.0 {
        didSet{
            self.scalePoints = SCNVector3(self.scaleValue, self.scaleValue, self.scaleValue)
        }
    }
    var scalePoints = SCNVector3(0.7, 0.7, 0.7)
    
    override init() {
        super.init()
    }
    /*init(id:String,modelname:String,modelpath:String,modelAnimatedpath:String,animationIdentifier:String,isPlaneSurface:Bool,isAnimatable:Bool,childModels:[model]=[],scaleValue:Float=0.7,isZoomable:Bool,isMarkerAvailable:Bool) {
     
     self.id = id
     self.modelname = modelname
     self.modelpath = modelpath
     self.modelAnimatedpath = modelAnimatedpath
     self.animationIdentifier=animationIdentifier
     self.isPlaneSurface = isPlaneSurface
     self.isAnimatable = isAnimatable
     self.childModels = childModels
     if self.childModels.count>0{
     showMenus = true
     }
     else{
     showMenus = false
     }
     self.scaleValue = scaleValue
     self.scalePoints = SCNVector3(self.scaleValue, self.scaleValue, self.scaleValue)
     self.isZoomable = isZoomable
     self.isMarkerAvailable = isMarkerAvailable
     }*/
    
    
}

