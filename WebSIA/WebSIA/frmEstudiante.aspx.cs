using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSIA
{
    public partial class frmEstudiante : System.Web.UI.Page
    {
        #region Variables
        static int intAccion; //0: Nada, 1: Agregar, 2: Modificar 
        #endregion

        #region Metodos propios
        private void llenarTipoDoc()
        {

        }
        private void llenarDpto()
        {
            ddlProg.Items.Add(new ListItem("Tecnología en informática musical", "10"));
        }
        private void Mensaje(string txt)
        {
            lblMsj.Text = txt;
        }
        private void Limpiar()
        {

        }
        private bool Grabar()
        {
            try
            {
                return true;
            }
            catch
            {

                return false;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                intAccion = 0;
            }
        }

        protected void mnuOpci_MenuItemClick(object sender, MenuEventArgs e)
        {
            string opc = mnuOpci.SelectedValue.ToLower();
            txtCodi.ReadOnly = true;
            ibtBusc.Visible = false;
            switch (opc)
            {
                case "opcbusc":
                    intAccion = 0;
                    Limpiar();
                    txtCodi.ReadOnly = false;
                    ibtBusc.Visible = true;
                    txtCodi.Focus();
                    break;
                case "opcagre":
                    intAccion = 1;
                    Limpiar();
                    ddlProg.Focus();
                    break;
                case "opcmodi":
                    intAccion = 2;
                    ddlProg.Focus();
                    break;
                case "opcgrab":
                    if (intAccion == 1 || intAccion == 2)
                    {
                        if ( Grabar() )
                            intAccion = 0;
                    }
                    break;
                default:
                    intAccion = 0;
                    Limpiar();
                    ddlProg.Focus();
                    break;
            }
        }
    }
}