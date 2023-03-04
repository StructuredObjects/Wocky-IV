module cnc

import net
import io 
import os

const(
  bar = "/root/Wocky-IV/asset/banners/bar.txt"
  banner = "/root/Wocky-IV/asset/banners/banner.txt"
)

pub fn cnc(mut conn net.TcpConn) {
   bars := os.read_file(bar) or {return}
   banners := os.read_file(banner) or {return}
   mut read := io.new_buffered_reader(reader: conn)
   conn.write_string(bars) or {0}
   conn.write_string(banners) or {0}

   for{
   		conn.write_string("\r\r\n@WockyIV# ") or {0}
   		
		input := read.read_line() or {return}
   }
}