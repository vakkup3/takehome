import Foundation

// MARK: - Protocol declaration

protocol FlickrSearchDebouncingProtocol: AnyObject {
    func run(action: @escaping () -> Void)
    func cancel()
}

// MARK: - Concrete type

final class FlickrSearchDebouncer {
    // MARK: - Properties
    
    private let delay: TimeInterval
    private var workItem: DispatchWorkItem?

    private let queue = DispatchQueue(label: "com.takehome.debouncer")
    private var timer: Timer?
    
    // MARK: - Initialization
    
    init(delaySeconds: TimeInterval = 1.0) {
        self.delay = delaySeconds
        scheduleDebounceTimer()
    }
    
    deinit {
        disposeDebounceTimer()
    }
}

// MARK: - Debouncing timer

private extension FlickrSearchDebouncer {
    func scheduleDebounceTimer() {
        disposeDebounceTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true, block: { _ in
            self.queue.async(flags: .barrier) {
                guard let workItem = self.workItem else {
                    return
                }
                
                self.workItem = nil
                
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: workItem)
            }
        })
    }
    
    func disposeDebounceTimer() {
        timer?.invalidate()
        timer = nil
    }
}

// MARK: - FlickrSearchDebouncingProtocol

extension FlickrSearchDebouncer: FlickrSearchDebouncingProtocol {
    func run(action: @escaping () -> Void) {
        queue.async(flags: .barrier) {
            self.workItem?.cancel()
            
            let workItem = DispatchWorkItem(block: action)
            self.workItem = workItem
        }
    }
    
    func cancel() {
        workItem?.cancel()
    }
}
