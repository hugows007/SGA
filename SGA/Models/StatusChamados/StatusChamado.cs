﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGA.Models.StatusChamados
{
    public class StatusChamado
    {
        public int Id { get; set; }
        public string NomeStatus { get; set; }
        public string DescStatus { get; set; }
        public int Status { get; set; }

    }
}