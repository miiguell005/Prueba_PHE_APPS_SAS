using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using PHE_APP_SAS.WEB.Modulos;
using PHE_APP_SAS.WEB.Negocio;

namespace PHE_APP_SAS.WEB.Controllers
{
    public class CursosController : ApiController
    {
        CursoModulo modulo = new CursoModulo();


        // GET: api/Cursos
        public IQueryable<Curso> GetCurso()
        {
            return modulo.GetCursos();
        }

        // GET: api/Cursos
        [Route("api/Cursos/Carreras")]
        public IQueryable<Carrera> GetCarreras()
        {
            return modulo.GetCarreras();
        }

        [Route("api/Cursos/Tango/Edades")]
        public dynamic GetRangoEdades()
        {
            return modulo.GetRangoEdades();
        }

        [Route("api/Cursos/clasificacion/genero")]
        public dynamic GetClasificacionGenero()
        {
            return modulo.GetClasificacionGenero();
        }

        // GET: api/Cursos/5
        [ResponseType(typeof(Curso))]
        public Curso GetCurso(int idCurso)
        {
            return modulo.GetCurso(idCurso);
        }        
    }
}