// rpi-gp.io
// raspberry pi gpio library for io
// Jacob Peck
// 20121113

// This code is licensed under the WTFPLv2:
//
//             DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//                    Version 2, December 2004
//
// Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
//
// Everyone is permitted to copy and distribute verbatim or modified
// copies of this license document, and changing it is allowed as long
// as the name is changed.
//
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//  0. You just DO WHAT THE FUCK YOU WANT TO.
//

GPIO := Object clone do(
  dir := "/sys/class/gpio"
  in := "in"
  out := "out"
  high := "1"
  low := "0"

  // helper method
  writeToFile := method(file, value,
    f := File with(file)
    f openForUpdating
    f write(value)
    f flush
    f close
  )

  // helper method
  readFromFile := method(file,
    f := File with(file)
    f openForReading
    v := f contents
    f close
    v
  )

  // export a gpio pin
  enablePin := method(pin,
    p := Path absolute(dir, "export")
    writeToFile(p, pin)
  )

  // unexport a gpio pin
  disablePin := method(pin,
    p := Path absolute(dir, "unexport")
    writeToFile(p, pin)
  )

  // set a pin's direction
  pinMode := method(pin, direction,
    p := Path absolute(dir, "gpio" .. pin, "direction")
    writeToFile(p, direction)
  )  

  // write a value to a pin
  digitalWrite := method(pin, value,
    p := Path absolute(dir, "gpio" .. pin, "value")
    writeToFile(p, value)
  )

  // read the value from a pin
  digitalRead := method(pin,
    p := Path absolute(dir, "gpio" .. pin, "value")
    readFromFile(p)
  )
)

// test if script being run as root, throw exception if not.
if(System getEnvironmentVariable("EUID") != "0",
  Exception raise("GPIO may only be manipulated by root!")
)

