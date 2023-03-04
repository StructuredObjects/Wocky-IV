import net
import time
import os
import core.cnc

fn handle_connections(mut conn net.TcpConn) {

  cnc.cnc(mut conn)

}

fn client_listener(port string) {
    mut server := net.listen_tcp(.ip6, ":${port}") or {return}
    for {
        mut conn := server.accept() or {
        continue
        }
        go handle_connections(mut conn)
    }
}

fn main() {
    port := os.input("1 - 65535: ")
    if port.int() > 65535 {
        eprint("Port out of range")
    } else if port.int() < 1 {
        eprint("Select a bigger port!")
    }
    client_listener(port)
}