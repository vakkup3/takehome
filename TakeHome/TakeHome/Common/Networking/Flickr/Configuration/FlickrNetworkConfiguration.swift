import Foundation

protocol FlickrNetworkConfigurationProtocol: NetworkConfigurationProtocol {}

struct FlickrNetworkConfiguration: FlickrNetworkConfigurationProtocol {
    var baseURL: URL {
        return URL(string: "https://www.flickr.com/services/rest/")!
    }
    
    var apiKey: String {
        return "1508443e49213ff84d566777dc211f2a"
    }
}
