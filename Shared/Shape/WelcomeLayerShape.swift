//
//  WelcomeLayerShape.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct WelcomeLayerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.050849*width, y: 0.358779*height))
        path.addCurve(to: CGPoint(x: 0.079253*width, y: 0.306803*height), control1: CGPoint(x: 0.038556*width, y: 0.336724*height), control2: CGPoint(x: 0.053299*width, y: 0.309746*height))
        path.addLine(to: CGPoint(x: 0.079253*width, y: 0.306803*height))
        path.addCurve(to: CGPoint(x: 0.120289*width, y: 0.252851*height), control1: CGPoint(x: 0.106755*width, y: 0.303683*height), control2: CGPoint(x: 0.125657*width, y: 0.278833*height))
        path.addLine(to: CGPoint(x: 0.114488*width, y: 0.224772*height))
        path.addCurve(to: CGPoint(x: 0.143728*width, y: 0.183042*height), control1: CGPoint(x: 0.110513*width, y: 0.205527*height), control2: CGPoint(x: 0.123604*width, y: 0.186844*height))
        path.addLine(to: CGPoint(x: 0.211945*width, y: 0.170155*height))
        path.addCurve(to: CGPoint(x: 0.223175*width, y: 0.16559*height), control1: CGPoint(x: 0.21598*width, y: 0.169393*height), control2: CGPoint(x: 0.219621*width, y: 0.16757*height))
        path.addLine(to: CGPoint(x: 0.223175*width, y: 0.16559*height))
        path.addCurve(to: CGPoint(x: 0.238823*width, y: 0.152319*height), control1: CGPoint(x: 0.229283*width, y: 0.162186*height), control2: CGPoint(x: 0.235459*width, y: 0.158266*height))
        path.addLine(to: CGPoint(x: 0.272942*width, y: 0.092*height))
        path.addCurve(to: CGPoint(x: 0.280823*width, y: 0.082434*height), control1: CGPoint(x: 0.275037*width, y: 0.088296*height), control2: CGPoint(x: 0.277721*width, y: 0.085091*height))
        path.addCurve(to: CGPoint(x: 0.324729*width, y: 0.063893*height), control1: CGPoint(x: 0.292594*width, y: 0.072351*height), control2: CGPoint(x: 0.309006*width, y: 0.065425*height))
        path.addCurve(to: CGPoint(x: 0.3385*width, y: 0.065036*height), control1: CGPoint(x: 0.329226*width, y: 0.063455*height), control2: CGPoint(x: 0.333886*width, y: 0.063799*height))
        path.addLine(to: CGPoint(x: 0.354811*width, y: 0.069403*height))
        path.addCurve(to: CGPoint(x: 0.372874*width, y: 0.061612*height), control1: CGPoint(x: 0.362009*width, y: 0.071331*height), control2: CGPoint(x: 0.36962*width, y: 0.068049*height))
        path.addLine(to: CGPoint(x: 0.372874*width, y: 0.061612*height))
        path.addCurve(to: CGPoint(x: 0.422483*width, y: 0.045101*height), control1: CGPoint(x: 0.381806*width, y: 0.043952*height), control2: CGPoint(x: 0.404017*width, y: 0.03656*height))
        path.addLine(to: CGPoint(x: 0.434863*width, y: 0.050826*height))
        path.addCurve(to: CGPoint(x: 0.440286*width, y: 0.049419*height), control1: CGPoint(x: 0.436786*width, y: 0.051715*height), control2: CGPoint(x: 0.439097*width, y: 0.051114*height))
        path.addLine(to: CGPoint(x: 0.440286*width, y: 0.049419*height))
        path.addCurve(to: CGPoint(x: 0.491817*width, y: 0.039684*height), control1: CGPoint(x: 0.451706*width, y: 0.033122*height), control2: CGPoint(x: 0.474777*width, y: 0.028764*height))
        path.addLine(to: CGPoint(x: 0.491817*width, y: 0.039684*height))
        path.addCurve(to: CGPoint(x: 0.551263*width, y: 0.028453*height), control1: CGPoint(x: 0.511477*width, y: 0.05228*height), control2: CGPoint(x: 0.538091*width, y: 0.047252*height))
        path.addLine(to: CGPoint(x: 0.559026*width, y: 0.017373*height))
        path.addCurve(to: CGPoint(x: 0.620583*width, y: 0.017153*height), control1: CGPoint(x: 0.573671*width, y: -0.003529*height), control2: CGPoint(x: 0.605774*width, y: -0.003644*height))
        path.addLine(to: CGPoint(x: 0.651834*width, y: 0.06104*height))
        path.addCurve(to: CGPoint(x: 0.696617*width, y: 0.078591*height), control1: CGPoint(x: 0.661734*width, y: 0.074943*height), control2: CGPoint(x: 0.67936*width, y: 0.081851*height))
        path.addLine(to: CGPoint(x: 0.696617*width, y: 0.078591*height))
        path.addCurve(to: CGPoint(x: 0.740254*width, y: 0.106552*height), control1: CGPoint(x: 0.71674*width, y: 0.074789*height), control2: CGPoint(x: 0.736277*width, y: 0.087308*height))
        path.addLine(to: CGPoint(x: 0.74528*width, y: 0.130889*height))
        path.addCurve(to: CGPoint(x: 0.775709*width, y: 0.167465*height), control1: CGPoint(x: 0.748443*width, y: 0.146197*height), control2: CGPoint(x: 0.764194*width, y: 0.156408*height))
        path.addLine(to: CGPoint(x: 0.775709*width, y: 0.167465*height))
        path.addCurve(to: CGPoint(x: 0.805871*width, y: 0.190183*height), control1: CGPoint(x: 0.784837*width, y: 0.176233*height), control2: CGPoint(x: 0.793411*width, y: 0.186846*height))
        path.addLine(to: CGPoint(x: 0.881203*width, y: 0.210354*height))
        path.addCurve(to: CGPoint(x: 0.906954*width, y: 0.254134*height), control1: CGPoint(x: 0.900954*width, y: 0.215643*height), control2: CGPoint(x: 0.912486*width, y: 0.235244*height))
        path.addLine(to: CGPoint(x: 0.906954*width, y: 0.254134*height))
        path.addCurve(to: CGPoint(x: 0.916011*width, y: 0.273344*height), control1: CGPoint(x: 0.904711*width, y: 0.26179*height), control2: CGPoint(x: 0.908529*width, y: 0.269883*height))
        path.addLine(to: CGPoint(x: 0.92984*width, y: 0.27974*height))
        path.addCurve(to: CGPoint(x: 0.947109*width, y: 0.32718*height), control1: CGPoint(x: 0.948309*width, y: 0.288279*height), control2: CGPoint(x: 0.956037*width, y: 0.309519*height))
        path.addLine(to: CGPoint(x: 0.947109*width, y: 0.32718*height))
        path.addCurve(to: CGPoint(x: 0.94858*width, y: 0.332363*height), control1: CGPoint(x: 0.946177*width, y: 0.329016*height), control2: CGPoint(x: 0.946806*width, y: 0.331227*height))
        path.addLine(to: CGPoint(x: 0.960003*width, y: 0.339686*height))
        path.addCurve(to: CGPoint(x: 0.970183*width, y: 0.388964*height), control1: CGPoint(x: 0.977046*width, y: 0.350604*height), control2: CGPoint(x: 0.981603*width, y: 0.372667*height))
        path.addLine(to: CGPoint(x: 0.970183*width, y: 0.388964*height))
        path.addCurve(to: CGPoint(x: 0.97714*width, y: 0.415874*height), control1: CGPoint(x: 0.963754*width, y: 0.398142*height), control2: CGPoint(x: 0.96698*width, y: 0.41062*height))
        path.addLine(to: CGPoint(x: 0.97954*width, y: 0.417117*height))
        path.addCurve(to: CGPoint(x: 0.99454*width, y: 0.465257*height), control1: CGPoint(x: 0.997583*width, y: 0.426451*height), control2: CGPoint(x: 1.004297*width, y: 0.448003*height))
        path.addLine(to: CGPoint(x: 0.934529*width, y: 0.571352*height))
        path.addCurve(to: CGPoint(x: 0.932286*width, y: 0.629413*height), control1: CGPoint(x: 0.924366*width, y: 0.589317*height), control2: CGPoint(x: 0.923537*width, y: 0.610781*height))
        path.addLine(to: CGPoint(x: 0.959837*width, y: 0.688087*height))
        path.addCurve(to: CGPoint(x: 0.943423*width, y: 0.733981*height), control1: CGPoint(x: 0.967843*width, y: 0.705131*height), control2: CGPoint(x: 0.960666*width, y: 0.725194*height))
        path.addLine(to: CGPoint(x: 0.913209*width, y: 0.74938*height))
        path.addCurve(to: CGPoint(x: 0.884857*width, y: 0.806519*height), control1: CGPoint(x: 0.891631*width, y: 0.760377*height), control2: CGPoint(x: 0.88012*width, y: 0.783582*height))
        path.addLine(to: CGPoint(x: 0.884857*width, y: 0.806519*height))
        path.addCurve(to: CGPoint(x: 0.855617*width, y: 0.848249*height), control1: CGPoint(x: 0.888834*width, y: 0.825765*height), control2: CGPoint(x: 0.875743*width, y: 0.844448*height))
        path.addLine(to: CGPoint(x: 0.783803*width, y: 0.861817*height))
        path.addCurve(to: CGPoint(x: 0.773909*width, y: 0.865896*height), control1: CGPoint(x: 0.78024*width, y: 0.862489*height), control2: CGPoint(x: 0.777011*width, y: 0.86409*height))
        path.addLine(to: CGPoint(x: 0.773909*width, y: 0.865896*height))
        path.addCurve(to: CGPoint(x: 0.761806*width, y: 0.87671*height), control1: CGPoint(x: 0.769129*width, y: 0.86868*height), control2: CGPoint(x: 0.764469*width, y: 0.872*height))
        path.addLine(to: CGPoint(x: 0.726406*width, y: 0.93929*height))
        path.addCurve(to: CGPoint(x: 0.717971*width, y: 0.949322*height), control1: CGPoint(x: 0.724189*width, y: 0.943213*height), control2: CGPoint(x: 0.721309*width, y: 0.946577*height))
        path.addCurve(to: CGPoint(x: 0.67232*width, y: 0.967085*height), control1: CGPoint(x: 0.705674*width, y: 0.959434*height), control2: CGPoint(x: 0.688506*width, y: 0.96612*height))
        path.addCurve(to: CGPoint(x: 0.659991*width, y: 0.965831*height), control1: CGPoint(x: 0.668274*width, y: 0.967328*height), control2: CGPoint(x: 0.664117*width, y: 0.966934*height))
        path.addLine(to: CGPoint(x: 0.641974*width, y: 0.961005*height))
        path.addCurve(to: CGPoint(x: 0.622269*width, y: 0.969503*height), control1: CGPoint(x: 0.63412*width, y: 0.958902*height), control2: CGPoint(x: 0.62582*width, y: 0.962481*height))
        path.addLine(to: CGPoint(x: 0.622269*width, y: 0.969503*height))
        path.addCurve(to: CGPoint(x: 0.57266*width, y: 0.986016*height), control1: CGPoint(x: 0.613337*width, y: 0.987164*height), control2: CGPoint(x: 0.591129*width, y: 0.994555*height))
        path.addLine(to: CGPoint(x: 0.56028*width, y: 0.98029*height))
        path.addCurve(to: CGPoint(x: 0.554857*width, y: 0.981697*height), control1: CGPoint(x: 0.558357*width, y: 0.979402*height), control2: CGPoint(x: 0.556046*width, y: 0.98*height))
        path.addLine(to: CGPoint(x: 0.554857*width, y: 0.981697*height))
        path.addCurve(to: CGPoint(x: 0.503326*width, y: 0.991432*height), control1: CGPoint(x: 0.54344*width, y: 0.997992*height), control2: CGPoint(x: 0.520366*width, y: 1.002352*height))
        path.addLine(to: CGPoint(x: 0.503326*width, y: 0.991432*height))
        path.addCurve(to: CGPoint(x: 0.443931*width, y: 0.988557*height), control1: CGPoint(x: 0.485603*width, y: 0.980077*height), control2: CGPoint(x: 0.462757*width, y: 0.978962*height))
        path.addLine(to: CGPoint(x: 0.443931*width, y: 0.988557*height))
        path.addCurve(to: CGPoint(x: 0.393686*width, y: 0.973918*height), control1: CGPoint(x: 0.425829*width, y: 0.997784*height), control2: CGPoint(x: 0.403334*width, y: 0.99123*height))
        path.addLine(to: CGPoint(x: 0.393686*width, y: 0.973918*height))
        path.addCurve(to: CGPoint(x: 0.333934*width, y: 0.946806*height), control1: CGPoint(x: 0.382186*width, y: 0.953284*height), control2: CGPoint(x: 0.357923*width, y: 0.942273*height))
        path.addLine(to: CGPoint(x: 0.302731*width, y: 0.952699*height))
        path.addCurve(to: CGPoint(x: 0.259093*width, y: 0.924738*height), control1: CGPoint(x: 0.282606*width, y: 0.956503*height), control2: CGPoint(x: 0.263069*width, y: 0.943984*height))
        path.addLine(to: CGPoint(x: 0.259093*width, y: 0.924738*height))
        path.addCurve(to: CGPoint(x: 0.212305*width, y: 0.889265*height), control1: CGPoint(x: 0.254713*width, y: 0.903538*height), control2: CGPoint(x: 0.234891*width, y: 0.888508*height))
        path.addLine(to: CGPoint(x: 0.209646*width, y: 0.889355*height))
        path.addCurve(to: CGPoint(x: 0.171245*width, y: 0.852128*height), control1: CGPoint(x: 0.18792*width, y: 0.890085*height), control2: CGPoint(x: 0.170187*width, y: 0.872893*height))
        path.addLine(to: CGPoint(x: 0.171245*width, y: 0.852128*height))
        path.addCurve(to: CGPoint(x: 0.155031*width, y: 0.830617*height), control1: CGPoint(x: 0.17175*width, y: 0.842219*height), control2: CGPoint(x: 0.165022*width, y: 0.833292*height))
        path.addLine(to: CGPoint(x: 0.117291*width, y: 0.820511*height))
        path.addCurve(to: CGPoint(x: 0.091539*width, y: 0.776732*height), control1: CGPoint(x: 0.097537*width, y: 0.815221*height), control2: CGPoint(x: 0.086008*width, y: 0.79562*height))
        path.addLine(to: CGPoint(x: 0.091539*width, y: 0.776732*height))
        path.addCurve(to: CGPoint(x: 0.083565*width, y: 0.759822*height), control1: CGPoint(x: 0.093513*width, y: 0.769992*height), control2: CGPoint(x: 0.090153*width, y: 0.762869*height))
        path.addLine(to: CGPoint(x: 0.065304*width, y: 0.751377*height))
        path.addCurve(to: CGPoint(x: 0.048037*width, y: 0.703937*height), control1: CGPoint(x: 0.046836*width, y: 0.742836*height), control2: CGPoint(x: 0.039106*width, y: 0.721596*height))
        path.addLine(to: CGPoint(x: 0.048037*width, y: 0.703937*height))
        path.addCurve(to: CGPoint(x: 0.046565*width, y: 0.698751*height), control1: CGPoint(x: 0.048966*width, y: 0.702098*height), control2: CGPoint(x: 0.048339*width, y: 0.699888*height))
        path.addLine(to: CGPoint(x: 0.03514*width, y: 0.691429*height))
        path.addCurve(to: CGPoint(x: 0.024959*width, y: 0.64215*height), control1: CGPoint(x: 0.018098*width, y: 0.680511*height), control2: CGPoint(x: 0.013541*width, y: 0.658448*height))
        path.addLine(to: CGPoint(x: 0.026479*width, y: 0.639984*height))
        path.addCurve(to: CGPoint(x: 0.019808*width, y: 0.614172*height), control1: CGPoint(x: 0.032646*width, y: 0.63118*height), control2: CGPoint(x: 0.029553*width, y: 0.619213*height))
        path.addLine(to: CGPoint(x: 0.019808*width, y: 0.614172*height))
        path.addCurve(to: CGPoint(x: 0.00481*width, y: 0.566033*height), control1: CGPoint(x: 0.001765*width, y: 0.604839*height), control2: CGPoint(x: -0.00495*width, y: 0.583287*height))
        path.addLine(to: CGPoint(x: 0.068665*width, y: 0.453145*height))
        path.addCurve(to: CGPoint(x: 0.068865*width, y: 0.391104*height), control1: CGPoint(x: 0.079604*width, y: 0.433803*height), control2: CGPoint(x: 0.079679*width, y: 0.410508*height))
        path.addLine(to: CGPoint(x: 0.050849*width, y: 0.358779*height))
        path.closeSubpath()
        return path
    }
}
