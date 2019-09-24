platform :ios, '12.4'

def common_pods
	pod 'Alamofire', '~> 4.9.0'
  pod 'RxAlamofire', '~> 4.2.0'
  pod 'RxSwift', '~> 4.2.0'
  pod 'SVProgressHUD', :git => 'https://github.com/SVProgressHUD/SVProgressHUD.git'
  pod 'Kingfisher', '~> 5.7.1'
end 

target 'Viptuner' do
  use_frameworks!
  inhibit_all_warnings!
  common_pods
end

target 'ViptunerTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'ViptunerUITests' do
  inherit! :search_paths
  # Pods for testing
end
