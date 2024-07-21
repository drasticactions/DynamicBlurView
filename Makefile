XBUILD=xcodebuild
ROOT=$(PWD)
PROJECT_ROOT=$(ROOT)
PROJECT=$(PROJECT_ROOT)/DynamicBlurView.xcodeproj
BUILD_ROOT=$(PROJECT_ROOT)/build
TARGET_IOS="DynamicBlurView"
TARGET_TVOS="DynamicBlurView"
PROJECTNAME=DynamicBlurView
OUTPUT=$(ROOT)/Build
FRAMEWORK_PATH=Products/Library/Frameworks/DynamicBlurView.framework
FRAMEWORKS=$(ROOT)/Frameworks
IOS_SDK=iphoneos18.0
BINDING_OUTPUT=$(ROOT)/../bindings

framework: iossimulator iosdevice maccatalyst tvossimulator tvosdevice xcframework

iossimulator:
	$(XBUILD) archive ONLY_ACTIVE_ARCH=NO -project $(PROJECT) -scheme $(TARGET_IOS) -destination "generic/platform=iOS Simulator" -archivePath $(BUILD_ROOT)/simulator.xcarchive -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

iosdevice:
	$(XBUILD) archive ONLY_ACTIVE_ARCH=NO -project $(PROJECT) -scheme $(TARGET_IOS) -destination "generic/platform=iOS" -archivePath $(BUILD_ROOT)/iOS.xcarchive -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

maccatalyst:
	$(XBUILD) archive ONLY_ACTIVE_ARCH=NO -project $(PROJECT) -scheme $(TARGET_IOS) -destination "generic/platform=macOS,variant=Mac Catalyst" -archivePath $(BUILD_ROOT)/catalyst.xcarchive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

tvossimulator:
	$(XBUILD) archive ONLY_ACTIVE_ARCH=NO -project $(PROJECT) -scheme $(TARGET_TVOS) -destination "generic/platform=tvOS Simulator,name=Any tvOS Simulator Device" -archivePath $(BUILD_ROOT)/tvsimulator.xcarchive -sdk appletvsimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

tvosdevice:
	$(XBUILD) archive ONLY_ACTIVE_ARCH=NO -project $(PROJECT) -scheme $(TARGET_TVOS) -destination "generic/platform=tvOS,name=Any tvOS Device" -archivePath $(BUILD_ROOT)/tvos.xcarchive -sdk appletvos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcframework:
	rm -rf $(BUILD_ROOT)/$(PROJECTNAME).xcframework
	$(XBUILD) -create-xcframework -framework $(BUILD_ROOT)/simulator.xcarchive/$(FRAMEWORK_PATH) -framework $(BUILD_ROOT)/tvsimulator.xcarchive/$(FRAMEWORK_PATH) -framework $(BUILD_ROOT)/tvos.xcarchive/$(FRAMEWORK_PATH) -framework $(BUILD_ROOT)/iOS.xcarchive/$(FRAMEWORK_PATH) -framework $(BUILD_ROOT)/catalyst.xcarchive/$(FRAMEWORK_PATH) -output $(BUILD_ROOT)/$(PROJECTNAME).xcframework
	rm -rf $(FRAMEWORKS)
	mkdir -p $(FRAMEWORKS)
	mv $(BUILD_ROOT)/$(PROJECTNAME).xcframework $(FRAMEWORKS)/$(PROJECTNAME).xcframework

dotnet:
	dotnet build $(ROOT)/Dotnet

nuget:
	dotnet pack $(ROOT)/Dotnet --configuration Release

sharpie:
	sharpie bind --sdk=$(IOS_SDK) --output="$(BINDING_OUTPUT)" --namespace="Drastic.$(PROJECTNAME)" --scope="$(FRAMEWORKS)/$(PROJECTNAME).xcframework/ios-arm64/$(PROJECTNAME).framework/Headers" $(FRAMEWORKS)/$(PROJECTNAME).xcframework/ios-arm64/$(PROJECTNAME).framework/Headers/*.h