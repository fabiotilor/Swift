import SwiftUI
import QuickPoseCore
import QuickPoseSwiftUI

struct ContentView: View {
    var quickPose = QuickPose(sdkKey: "01JTZV04J69PJGFBR66S6H7CFK")

    @State var twistCounter = QuickPoseThresholdCounter(enterThreshold: 0.7, exitThreshold: 0.2)
    @State var overlayImage: UIImage?
    @State var count: Int?
    @State var feedbackText: String?
    @State var scale = 1.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if ProcessInfo.processInfo.isiOSAppOnMac,
                   let url = Bundle.main.url(forResource: "Russian_Twist", withExtension: "mov") {
                    QuickPoseSimulatedCameraView(useFrontCamera: true, delegate: quickPose, video: url)
                } else {
                    QuickPoseCameraView(useFrontCamera: true, delegate: quickPose)
                }

                QuickPoseOverlayView(overlayImage: $overlayImage)
            }
            .overlay(alignment: .top) {
                if let count = count {
                    Text("\(count) twists")
                        .foregroundColor(.white)
                        .font(.system(size: 32))
                        .padding(100)
                        .scaleEffect(scale)
                }
            }
            .overlay(alignment: .bottom) {
                if let feedback = feedbackText {
                    Text(feedback)
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .multilineTextAlignment(.center)
                        .padding(100)
                }
            }
            .frame(width: geometry.size.width)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                let style = QuickPose.Style(
                    relativeFontSize: 0.3,
                    relativeArcSize: 0.3,
                    relativeLineWidth: 0.3,
                    conditionalColors: [
                        QuickPose.Style.ConditionalColor(min: nil, max: 40, color: .green)
                    ]
                )

                let russianTwistAngleFeature = QuickPose.Feature.measureAngleBody(
                    origin: .hipMid,
                    p1: .shoulder(side: .left),
                    p2: .shoulder(side: .right),
                    clockwiseDirection: true,
                    style: style
                )

                quickPose.start(features: [russianTwistAngleFeature]) { status, outputImage, result, feedback, _ in
                    overlayImage = outputImage

                    if let fitnessResult = result[russianTwistAngleFeature] {
                        let angle = fitnessResult.value
                        print("Current Angle Value: \(angle)")

                        //Normalization of the angles, due to bad reps counting
                        let minAngle: Double = 0.0
                        let maxAngle: Double = 40.0
                        let clampedAngle = min(max(angle, minAngle), maxAngle)
                        let normalizedValue = (clampedAngle - minAngle) / (maxAngle - minAngle)
                        print("Normalized Angle: \(normalizedValue)")

                        let counterState = twistCounter.count(normalizedValue) { counterStatus in
                            switch counterStatus {
                            case .poseEntered(let reps):
                                print("Entered pose. Reps so far: \(reps). Value: \(angle)")
                            case .poseComplete(let reps):
                                print("Completed rep #\(reps). Value: \(angle)")
                                count = reps
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    scale = 2.0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        scale = 1.0
                                    }
                                }
                            }
                        }
                        print("Counter State: \(counterState)")
                    }
                }
            }
        }
    }
}
