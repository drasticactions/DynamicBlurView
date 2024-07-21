using System;
using CoreAnimation;
using DynamicBlurView;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace DynamicBlurView
{
	// @interface CaptureQualityHelper : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC15DynamicBlurView20CaptureQualityHelper")]
	interface CaptureQualityHelper
	{
		// +(id)imageScaleForQuality:(enum CaptureQuality)quality __attribute__((warn_unused_result("")));
		[Static]
		[Export ("imageScaleForQuality:")]
		NSObject ImageScaleForQuality (CaptureQuality quality);

		// +(id)interpolationQualityForQuality:(enum CaptureQuality)quality __attribute__((warn_unused_result("")));
		[Static]
		[Export ("interpolationQualityForQuality:")]
		NSObject InterpolationQualityForQuality (CaptureQuality quality);
	}

	// @interface DynamicBlurView
	interface DynamicBlurView
	{
		// @property (readonly, nonatomic, class) Class _Nonnull layerClass;
		[Static]
		[Export ("layerClass")]
		Class LayerClass { get; }

		// -(void)displayLayer:(CALayer * _Nonnull)layer;
		[Export ("displayLayer:")]
		void DisplayLayer (CALayer layer);

		// @property (nonatomic) int blurRadius;
		[Export ("blurRadius")]
		int BlurRadius { get; set; }

		// @property (nonatomic) enum TrackingMode trackingMode;
		[Export ("trackingMode", ArgumentSemantic.Assign)]
		TrackingMode TrackingMode { get; set; }

		// @property (nonatomic, strong) UIColor * _Nullable blendColor;
		[NullAllowed, Export ("blendColor", ArgumentSemantic.Strong)]
		UIColor BlendColor { get; set; }

		// @property (nonatomic) int blendMode;
		[Export ("blendMode")]
		int BlendMode { get; set; }

		// @property (nonatomic) NSInteger iterations;
		[Export ("iterations")]
		nint Iterations { get; set; }

		// @property (nonatomic) BOOL isDeepRendering;
		[Export ("isDeepRendering")]
		bool IsDeepRendering { get; set; }

		// @property (nonatomic) int blurRatio;
		[Export ("blurRatio")]
		int BlurRatio { get; set; }

		// @property (nonatomic) enum CaptureQuality quality;
		[Export ("quality", ArgumentSemantic.Assign)]
		CaptureQuality Quality { get; set; }

		// -(instancetype _Nonnull)initWithFrame:(id)frame __attribute__((objc_designated_initializer));
		[Export ("initWithFrame:")]
		[DesignatedInitializer]
		NativeHandle Constructor (NSObject frame);

		// -(instancetype _Nullable)initWithCoder:(NSCoder * _Nonnull)aDecoder __attribute__((objc_designated_initializer));
		[Export ("initWithCoder:")]
		[DesignatedInitializer]
		NativeHandle Constructor (NSCoder aDecoder);

		// -(void)didMoveToWindow;
		[Export ("didMoveToWindow")]
		void DidMoveToWindow ();

		// -(void)didMoveToSuperview;
		[Export ("didMoveToSuperview")]
		void DidMoveToSuperview ();
	}

	// @interface TrackingModeHelper : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC15DynamicBlurView18TrackingModeHelper")]
	interface TrackingModeHelper
	{
		// +(NSString * _Nonnull)descriptionForMode:(enum TrackingMode)mode __attribute__((warn_unused_result("")));
		[Static]
		[Export ("descriptionForMode:")]
		string DescriptionForMode (TrackingMode mode);
	}
}
