import XCTest
import KTVHTTPCache

final class KTVHTTPCacheImportTests: XCTestCase {
    func testPublicTypesCanBeImported() {
        _ = KTVHTTPCache.self
        _ = KTVHCDataRequest.self
        _ = KTVHCDataLoader.self
    }
}
