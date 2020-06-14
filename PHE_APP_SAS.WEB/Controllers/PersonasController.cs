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
    public class PersonasController : ApiController
    {
        PersonaModulo modulo = new PersonaModulo();

        // GET: api/Cursos
        [HttpGet]
        [Route("api/Persona")]
        public IQueryable<Persona> GetPersona()
        {
            return modulo.GetPersona();
        }

        [HttpGet]
        [Route("api/Persona")]
        public Persona GetPersona(int idPersona)
        {
            return modulo.GetPersona(idPersona);
        }

        [HttpPost]
        [Route("api/Persona")]
        public Persona PostPersona(Persona persona)
        {
            if (persona.IdPersona == 0)
                return modulo.CrearPersona(persona);

            else
                return modulo.EditarPersona(persona, persona.IdPersona);
        }

        //[HttpPut]
        //[Route("api/Persona")]
        //public Persona PutPersona(Persona persona, int idPersona)
        //{

        //}

        [HttpDelete]
        [Route("api/Persona")]
        public void DeletePersona(int idPersona)
        {
            modulo.EliminarPersona(idPersona);
        }

    }
}