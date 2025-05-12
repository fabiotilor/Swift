🏋️‍♂️ Custom Exercise Repetition Counter (Russian Twist) using QuickPose in SwiftUI
====================================================================================

This SwiftUI project shows how to use the **QuickPose SDK** to implement a **custom repetition counter** for exercises. It focuses on **Russian Twists**, but the same technique can be extended to other movements.

* * * * *

✨ What This App Does
--------------------

-   Tracks the user's body in real time via camera or simulated video

-   Measures the **angle between the shoulders** to detect torso twisting

-   Normalizes the angle value and uses a **threshold-based state machine** to count each rep

-   Provides live **visual feedback** and an animated counter overlay

* * * * *

🧠 How the Counter Logic Works
------------------------------

### 📦 `QuickPoseThresholdCounter`

The rep counter works using a **threshold-enter-exit pattern** that mimics human motion:

`@State var twistCounter = QuickPoseThresholdCounter(enterThreshold: 0.7, exitThreshold: 0.2)`

-   `enterThreshold`: The normalized value the user must exceed to be considered "in the pose" (e.g. twisted far enough)

-   `exitThreshold`: The normalized value the user must drop below before the **next rep can begin**

Each cycle of entering and then exiting the pose counts as **one repetition**.

#### 🚦 States

The counter returns a `CountState` enum with:

-   `.poseEntered(reps: Int)` --- when the user enters the pose threshold

-   `.poseComplete(reps: Int)` --- when the user completes a full repetition

We also provide animations when `.poseComplete` is triggered, using SwiftUI.

* * * * *

🎯 Constructing the Tracking Feature
------------------------------------

We use:

`QuickPose.Feature.measureAngleBody(
    origin: .hipMid,
    p1: .shoulder(side: .left),
    p2: .shoulder(side: .right),
    clockwiseDirection: true,
    style: style
)`

This measures the **angle between the shoulders**, using the hip midpoint as a base. This effectively captures the torso twist required for Russian Twists.

You can customize:

-   **Landmarks**: Any combination of body points (hips, knees, shoulders, etc.)

-   **Clockwise direction**: To define which direction is considered positive rotation

-   **Style**: Visualization settings (e.g., conditional coloring, size, thickness)

* * * * *

🧪 Normalizing the Value
------------------------

The raw angles are clamped and normalized to ensure consistent behavior across different body types and camera angles:

swift

CopyEdit

`let clampedAngle = min(max(angle, minAngle), maxAngle)
let normalizedValue = (clampedAngle - minAngle) / (maxAngle - minAngle)`

This converts any raw angle into a value between 0 and 1, suitable for threshold comparison.

* * * * *

📲 UI and Feedback
------------------

We use:

-   `QuickPoseCameraView` or `QuickPoseSimulatedCameraView` for real-time input

-   `QuickPoseOverlayView` for drawing pose lines

-   A text overlay that displays the **rep count** and feedback

swift

CopyEdit

`Text("\(count) twists")
Text(feedbackText)`

SwiftUI's animation API adds visual cues when a rep is counted (e.g., scaling effect).

* * * * *

🛠️ Customizing for Other Exercises
-----------------------------------

To adapt this for another movement:

1.  Choose a different combination of landmarks using `measureAngleBody`, `measureLineBody`, or other feature types.

2.  Adjust the thresholds (`enterThreshold`, `exitThreshold`)

3.  Modify the normalization range

4.  Update UI labels and feedback

QuickPose offers many predefined features, including:

-   `.thumbsUp`

-   `.raisedFingers`

-   `.rangeOfMotion`

-   `.fitness` presets

See the `QuickPose.Feature` enum for all supported types.

* * * * *

✅ How to Run
------------

1.  Clone the repo

2.  Replace with your QuickPose SDK key:

    swift

    CopyEdit

    `var quickPose = QuickPose(sdkKey: "YOUR_SDK_KEY_HERE")`

3.  Run the app on iOS or Mac with a simulated video

* * * * *


