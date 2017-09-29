using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chats
{
    public class ChatPrivado : Chat
    {
        public int IdPrivado { get; set; }
        public string IdUsrMBOrig { get; set; }
        public string IdUsrMBDest { get; set; }
        public int IdUsrDest { get; set; }
        public string NomeDest { get; set; }
    }
}