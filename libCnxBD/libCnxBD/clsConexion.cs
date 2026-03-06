using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace libCnxBD
{
    public class clsCnxBD
    {
        #region Atributos
        protected bool blnHayCnx;
        protected SqlConnection objCnx;
        protected SqlCommand objCmd;
        protected SqlParameter objParam;
        #endregion

        #region Propiedades
        public string SQL { private get; set; }
        public string cadCnx { private get; set; }
        public object vrRpta {  get; private set; }
        public string Error {  get; private set; }
        public SqlDataReader ReaderLleno { get; private set; } 
        #endregion

        #region Constructor
        public clsCnxBD()
        {
            blnHayCnx = false;
            objCnx = new SqlConnection();
            objCmd = new SqlCommand();
            objParam = new SqlParameter();
        }
        #endregion

        #region Metodos
        private bool abrirCnx()
        {
            if (string.IsNullOrEmpty(cadCnx))
                return false;
            objCnx.ConnectionString = cadCnx;
            try
            {
                objCnx.Open();
                blnHayCnx = true;
                return true;
            }
            catch (Exception)
            {

                Error = "Error, por favor reintentar nuevamente";
                blnHayCnx = false;
                return false;
            }
        }

        public void cerrarCnx()
        {
            try
            {
                if (blnHayCnx)
                    objCnx.Close();

                objCnx = null;
                blnHayCnx = false;
            }
            catch (Exception)
            {

                Error = "Error al intentar cerrar la conexión";
            }
        }

        public bool Consultar(bool blnTipoEjec)
        {
            try
            {
                if (string.IsNullOrEmpty(SQL) || string.IsNullOrEmpty(cadCnx))
                {
                    Error = "Faltan datos";
                    return false;
                }
                if (!blnHayCnx)
                    if (!abrirCnx())
                        return false;
                objCmd.Connection = objCnx; //Preparar el comando para ejecutar la transacción SQL en l aBD
                objCmd.CommandText = SQL;
                if (blnTipoEjec)
                    objCmd.CommandType = CommandType.StoredProcedure; // Asincrónico
                else
                    objCmd.CommandType = CommandType.Text; //Sincronico
                ReaderLleno = objCmd.ExecuteReader(); //Realizar la transacción en la DB
                return true;
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}
