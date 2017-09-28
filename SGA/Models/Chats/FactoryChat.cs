using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.Chats
{
    public class FactoryChat
    {
        internal static Chat GetNew()
        {
            return new Chat();
        }
    }
}