using ObjCRuntime;

namespace DynamicBlurView
{
	[Native]
	public enum CaptureQuality : long
	{
		Default = 0,
		Low = 1,
		Medium = 2,
		High = 3
	}

	[Native]
	public enum TrackingMode : long
	{
		Tracking = 0,
		Common = 1,
		None = 2
	}
}
