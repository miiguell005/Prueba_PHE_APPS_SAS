using PHE_APP_SAS.WEB.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PHE_APP_SAS.WEB.Modulos
{
    public class CursoModulo : IDisposable
    {
        private PHE_APPS_SASEntities db = new PHE_APPS_SASEntities();

        public CursoModulo()
        {
            db.Configuration.LazyLoadingEnabled = false;
        }

        //Consulta un curso
        public Curso GetCurso(int idCurso)
        {                       
            return db.Curso.Include("Carrera").Include("Categoria").Include("Modalidad").Include("TipoCurso").Include("CursoPersona")
                .Where(c => c.IdCurso == idCurso).FirstOrDefault();
        }

        public IQueryable<Curso> GetCursos()
        {
            return db.Curso.Include("Carrera").Include("Categoria").Include("Modalidad").Include("TipoCurso");
        }
        
        /// <summary>
        /// Retorna todas las carreras 
        /// </summary>
        /// <returns></returns>
        public IQueryable<Carrera> GetCarreras()
        {
            return db.Carrera.Include("Curso");
        }

        /// <summary>
        /// Retorna todas las categorias de los cursos
        /// </summary>
        /// <returns></returns>
        public IQueryable<Categoria> GetCategorias()
        {
            return db.Categoria;
        }

        /// <summary>
        /// Retorna todas las modalidades para los cursos
        /// </summary>
        /// <returns></returns>
        public IQueryable<Modalidad> GetModalidades()
        {
            return db.Modalidad;
        }

        /// <summary>
        /// REtorna todos los tipos de cursos
        /// </summary>
        /// <returns></returns>
        public IQueryable<TipoCurso> GetTiposCurso()
        {
            return db.TipoCurso;
        }

        /// <summary>
        /// Ejecuta el procedimiento almacenado sp_rangoEdades que realizael conteo de rango de edades
        /// </summary>
        /// <returns></returns>
        public dynamic GetRangoEdades()
        {
            return db.sp_rangoEdades();
        }

        /// <summary>
        /// Ejecuta el procedimiento almacenado para contar cuantos son masculinos femenino y otro
        /// </summary>
        /// <returns></returns>
        public dynamic GetClasificacionGenero()
        {
            return db.sp_clasificacionGenero();
        }

        public void Dispose()
        {
            db.Dispose();
        }
    }
}