protocol ControllerLifecycleInteractable {
    func load(request: ControllerLifecycleUseCases.Load.Request)
    func appear(request: ControllerLifecycleUseCases.Appear.Request)
    func disappear(request: ControllerLifecycleUseCases.Disappear.Request)
}

extension ControllerLifecycleInteractable {
    func load(request _: ControllerLifecycleUseCases.Load.Request) {}
    func appear(request _: ControllerLifecycleUseCases.Appear.Request) {}
    func disappear(request _: ControllerLifecycleUseCases.Disappear.Request) {}
}
