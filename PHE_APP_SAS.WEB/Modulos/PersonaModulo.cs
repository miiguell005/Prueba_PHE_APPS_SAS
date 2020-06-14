using PHE_APP_SAS.WEB.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PHE_APP_SAS.WEB.Modulos
{
    public class PersonaModulo : IDisposable
    {

        private PHE_APPS_SASEntities db = new PHE_APPS_SASEntities();

        /// <summary>
        /// Obtiene toda la informacion de la persona
        /// </summary>
        /// <param name="idPersona"></param>
        /// <returns></returns>
        public Persona GetPersona(int idPersona)
        {
            return db.Persona.Find(idPersona);
        }

        /// <summary>
        /// Retorna todas las personas registradas en la base de datos
        /// </summary>
        /// <returns></returns>
        public IQueryable<Persona> GetPersona()
        {
            //Para que traiga solo la informacion de la persona sin ninguna relaciones mas 
            db.Configuration.LazyLoadingEnabled = false;

            return db.Persona.Include("CursoPersona.Curso");
        }


        /// <summary>
        /// Crea una nueva persona
        /// </summary>
        /// <param name="persona"></param>
        /// <returns></returns>
        public Persona CrearPersona(Persona persona)
        {
            db.Persona.Add(persona);
            db.SaveChanges();

            return persona;
        }

        /// <summary>
        /// Edita la informacion de la persona
        /// </summary>
        /// <param name="personaDto"></param>
        /// <param name="idPersona"></param>
        /// <returns></returns>
        public Persona EditarPersona(Persona personaDto, int idPersona)
        {

            var persona = db.Persona.Find(idPersona);

            if (persona == null)
                throw new Exception("No se ha encontrado la persona con Id " + idPersona);

            persona.Apellido = personaDto.Apellido;
            persona.Genero = personaDto.Genero;
            persona.Hobbies = personaDto.Hobbies;
            persona.LugarNacimiento = personaDto.LugarNacimiento;
            persona.LugarResidencia = personaDto.LugarResidencia;
            persona.Nombre = personaDto.Nombre;

            //Actualiza los cursos de la persona
            if (personaDto.CursoPersona.Count() > 0 || persona.CursoPersona.Count() > 0)
            {

                //Actualiza o elimina los cursos que tiene la persona
                foreach (var cpDto in personaDto.CursoPersona)
                {
                    var cp = persona.CursoPersona.Where(_cp => _cp.IdCursoPersona == cpDto.IdCursoPersona).FirstOrDefault();
                    
                    if (cpDto.IdCursoPersona == 0)
                        db.CursoPersona.Add(cpDto);

                    else if (cpDto.Eliminado == true)
                        db.CursoPersona.Remove(cp);
                    
                    else
                        cp.DictaCurso = cpDto.DictaCurso;
                }
            }

            db.SaveChanges();

            return personaDto;
        }

        /// <summary>
        /// Elimina la persona
        /// </summary>
        /// <param name="idPersona"></param>
        public void EliminarPersona(int idPersona)
        {
            var persona = db.Persona.Find(idPersona);

            if (persona == null)
                throw new Exception("No se encontro la persona con Id " + idPersona);

            persona.Eliminado = true;
            //db.Persona.Remove(persona);

            db.SaveChanges();
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }
}
