using Microsoft.EntityFrameworkCore;

namespace WebAPI.Data
{
    public class NADContext : DbContext
    {
        public NADContext(DbContextOptions<NADContext> options) : base(options) 
        {
        
        }

        #region DbSet
        public DbSet<Book>? Books { get; set; }
        #endregion
    }
}
