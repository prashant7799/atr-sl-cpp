from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout, CMakeDeps


class atr_slRecipe(ConanFile):
    name = "atr_sl"
    version = "1.0"
    package_type = "library"

    # Which third-party packages this recipe needs
    requires = (
        "gtest/1.14.0",
        "benchmark/1.8.4",
    )

    # Helpers that teach CMake where the deps are
    generators = ("CMakeToolchain", "CMakeDeps")


    # Optional metadata
    license = "<Put the package license here>"
    author = "<Put your name here> <And your email here>"
    url = "<Package recipe repository url here, for issues about the package>"
    description = "<Description of atr_sl package here>"
    topics = ("<Put some tag here>", "<here>", "<and here>")

    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}

    # Sources are located in the same place as this recipe, copy them to the recipe
    exports_sources = "CMakeLists.txt", "src/*", "include/*"

    def config_options(self):
        if self.settings.os == "Windows":
            self.options.rm_safe("fPIC")

    def configure(self):
        if self.options.shared:
            self.options.rm_safe("fPIC")

    def layout(self):
        cmake_layout(self)
    
    #def generate(self):
    #    deps = CMakeDeps(self)
    #    deps.generate()
    #    tc = CMakeToolchain(self)
    #    tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

    def package_info(self):
        self.cpp_info.libs = ["atr_sl"]

