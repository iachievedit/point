import PackageDescription

let package = Package(
    name: "point",
    dependencies:[
	    .Package(url:"https://github.com/vapor/mysql", majorVersion:1)
    ]
)
