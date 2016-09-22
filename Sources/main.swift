// MIT License
import Glibc
import MySQL

var mysql:Database
do {
  mysql = try Database(host:"localhost",
                       user:"swift",
                       password:"swiftpass",
                       database:"swift_test")
  try mysql.execute("SELECT @@version")
} catch {
  print("Unable to connect to MySQL:  \(error)")
  exit(-1)
}

do {
  try mysql.execute("DROP TABLE IF EXISTS locations")
  try mysql.execute("CREATE TABLE locations (location POINT)")
  
  let point = (37.20262, -112.98785)

  try mysql.execute("INSERT INTO locations VALUES (POINT\(point))")

  let textResults = try mysql.execute("SELECT AsText(location) FROM locations")
  print(textResults)
  
  let results     = try mysql.execute("SELECT * FROM locations")
  print(results)
} catch {
  print("Fatality:  \(error)")
  exit(-1)
}

exit(0)
