import SwiftUI

struct ContentView: View {
    @State var buttonHeight: Double = .zero

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac cursus nisl. Ut tincidunt nunc ut mauris finibus maximus. Donec libero ex, dapibus in placerat non, volutpat et turpis. Maecenas convallis quis est vitae fringilla. Nullam augue sapien, porta sit amet pulvinar vitae, accumsan id tellus. Nam condimentum laoreet congue. Cras enim velit, maximus eget cursus id, gravida sit amet libero. \n")
                    Text("Mauris rutrum dolor nunc, vel auctor diam luctus ac. Donec tincidunt ornare tincidunt. Cras felis purus, commodo ac auctor eu, ornare quis neque. Nunc ullamcorper massa scelerisque, ornare justo eget, consequat sapien. Sed vulputate hendrerit nibh, vitae fringilla tortor. Integer laoreet mauris ut neque dignissim sagittis. Maecenas sit amet ipsum magna. In cursus dui non ante auctor iaculis. Praesent blandit, libero id tempus pretium, nisi enim sodales dui, eget finibus metus metus ut ipsum. Morbi tristique, metus quis ullamcorper hendrerit, neque turpis varius nisi, quis dictum nulla mauris sed erat. Morbi velit ligula, bibendum ut arcu sed, ullamcorper sollicitudin tortor. Nunc ultricies mattis leo, sit amet porta mi varius suscipit. \n")
                    Text("Cras eget lorem justo. Nunc consequat lacinia eros, eget scelerisque enim tempus ut. Suspendisse at tellus mauris. Etiam vel auctor neque. Praesent nec ligula vitae dolor tempor malesuada nec id sapien. Donec mattis augue ac nunc pharetra, ut imperdiet mi ultricies. Fusce id nulla lacinia elit tincidunt venenatis nec malesuada dui. Maecenas consectetur turpis vel eros molestie interdum. Mauris vestibulum odio nibh, eget tristique neque interdum dapibus. Vestibulum commodo ligula in tempus suscipit. Mauris scelerisque turpis in nunc tempus suscipit. Nulla tempus fermentum dui rutrum posuere. Aenean elit est, lobortis quis leo efficitur, pretium sollicitudin arcu. Maecenas et leo scelerisque, dignissim arcu a, pellentesque ipsum.")
                }
                .padding(.bottom, 40 + buttonHeight)
            }
            .padding([.trailing, .leading], 10)
            .edgesIgnoringSafeArea(.bottom)

            Button {} label: {
                Text("Hello!")
                    .tint(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.yellow)
                    )
                    .frame(maxWidth: 80)
            }
            .getSize { size in
                buttonHeight = size.height
            }
        }
    }
}

extension View {
    func getSize(size: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: ViewPreferenceKey.self, value: geo.size)
            }
        )
        .onPreferenceChange(ViewPreferenceKey.self, perform: size)
    }
}

struct ViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
