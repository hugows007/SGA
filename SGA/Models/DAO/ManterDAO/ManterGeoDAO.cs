using SGA.DAO;
using SGA.Models.DAO.Log;
using SGA.Models.Geos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SGA.Models.DAO.ManterDAO
{
    public class ManterGeoDAO
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
            List<Geo> List = new List<Geo>();
            SqlDataReader Dr = null;

            try
            {
                using (SqlConnection Con = new Conexao().ConexaoDB())
                {

                    SqlCommand Cmd = new SqlCommand(@"
                SELECT L1.*, L3.nome FROM Geolocalizacao As L1
                    INNER JOIN (
                        SELECT idUsuario, MAX(dataRegistro) As UltimaData
                        FROM Geolocalizacao  WHERE
							LATITUDE <> '0.0' AND LONGITUDE <> '0.0' GROUP BY idUsuario) As L2
                            ON (L1.idUsuario = L2.idUsuario AND L1.dataRegistro = L2.UltimaData) 
		                    INNER JOIN Usuario As L3 on (L1.idUsuario = L3.idUsuario)
                    ORDER BY L1.idUsuario;", Con);

                    Dr = Cmd.ExecuteReader();

                    while (Dr.Read())
                    {
                        Geo GeoLoc = FactoryGeo.GetNew();

                        GeoLoc.Id = Dr.GetInt32(0);
                        GeoLoc.Latitude = Dr.GetString(1);
                        GeoLoc.Longitude = Dr.GetString(2);
                        GeoLoc.IdUsr = Dr.GetInt32(3);
                        GeoLoc.Data = Dr.GetDateTime(4);
                        GeoLoc.NomeUsuario = Dr.GetString(5);
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
                                      ,[dataRegistro])
                                VALUES
                                    (@Lat
                                    ,@Long
                                    ,@IdUsuario
                                    ,@Data);", Con);

                    Cmd.Parameters.AddWithValue("@Lat", ObjGeo.Latitude);
                    Cmd.Parameters.AddWithValue("@Long", ObjGeo.Longitude);
                    Cmd.Parameters.AddWithValue("@IdUsuario", ObjGeo.IdUsr);
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
    }
}