using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Geos;
using SGA.Models.Manter;
using SGA.Models.Usuarios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterGeoDAO : ManterGeo
    {
        Geo ObjGeo;
        public ManterGeoDAO()
        {

        }
        public ManterGeoDAO(Geo ObjGeo)
        {
            this.ObjGeo = ObjGeo;
        }
        public List<Geo> InformaGeoDAO()
        {
            try
            {
                List<Geo> List = new List<Geo>();
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT L1.*, L3.nome FROM Geolocalizacao As L1
                    INNER JOIN (
                        SELECT idUsuario, MAX(dataRegistro) As UltimaData
                        FROM Geolocalizacao  WHERE
							LATITUDE <> '0.0' AND LONGITUDE <> '0.0' and idEmpresa = @Empresa GROUP BY idUsuario) As L2
                            ON (L1.idUsuario = L2.idUsuario AND L1.dataRegistro = L2.UltimaData) 
		                    INNER JOIN Usuario As L3 on (L1.idUsuario = L3.idUsuario)
                    ORDER BY L1.idUsuario;", Con);

                    Cmd.Parameters.AddWithValue("@Empresa", InfoGlobal.GlobalIdEmpresa);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Geo GeoLoc = FactoryGeo.GetNew();

                        GeoLoc.Id = Dr.GetInt32(0);
                        GeoLoc.Latitude = Dr.GetString(1);
                        GeoLoc.Longitude = Dr.GetString(2);
                        GeoLoc.IdUsr = Dr.GetInt32(3);
                        GeoLoc.Data = Dr.GetDateTime(5);
                        GeoLoc.NomeUsuario = Dr.GetString(6);
                        List.Add(GeoLoc);
                    }

                    return List;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
        public bool GravaGeoDAO()
        {
            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {
                    SqlCommand Cmd = new SqlCommand(@"
                                INSERT INTO [dbo].[Geolocalizacao]
                                    ([latitude]
                                      ,[longitude]
                                      ,[idUsuario]
                                      ,[idEmpresa]
                                      ,[dataRegistro])
                                VALUES
                                    (@Lat
                                    ,@Long
                                    ,@IdUsuario
                                    ,@IdEmpresa
                                    ,@Data);", Con);

                    Cmd.Parameters.AddWithValue("@Lat", ObjGeo.Latitude);
                    Cmd.Parameters.AddWithValue("@Long", ObjGeo.Longitude);
                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjGeo.IdUsr);
                    Cmd.Parameters.AddWithValue("@IdEmpresa", ObjGeo.IdEmpresa);
                    Cmd.Parameters.AddWithValue("@Data", DateTime.Now);

                    Cmd.ExecuteNonQuery();

                    return true;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Geo GetTecnicoLocalizacaoDAO()
        {
            try
            {
                List<Geo> List = new List<Geo>();
                SqlDataReader Dr = null;

                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT L1.*, L3.nome FROM Geolocalizacao As L1
                    INNER JOIN (
                        SELECT idUsuario, MAX(dataRegistro) As UltimaData
                        FROM Geolocalizacao  WHERE
							LATITUDE <> '0.0' AND LONGITUDE <> '0.0' AND idUsuario = @IdTecnico GROUP BY idUsuario) As L2
                            ON (L1.idUsuario = L2.idUsuario AND L1.dataRegistro = L2.UltimaData) 
		                    INNER JOIN Usuario As L3 on (L1.idUsuario = L3.idUsuario)
                    ORDER BY L1.idUsuario;", Con);

                    Cmd.Parameters.AddWithValue("@IdTecnico", ObjGeo.IdUsr);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        ObjGeo.Id = Dr.GetInt32(0);
                        ObjGeo.Latitude = Dr.GetString(1);
                        ObjGeo.Longitude = Dr.GetString(2);
                        ObjGeo.IdUsr = Dr.GetInt32(3);
                        ObjGeo.Data = Dr.GetDateTime(5);
                        ObjGeo.NomeUsuario = Dr.GetString(6);
                    }

                    return ObjGeo;
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }
    }
}