using Ashoka.HMS.Entities;
using Microsoft.EntityFrameworkCore;

namespace Ashoka.HMS.EFCore
{
    public class HMSDbContext : DbContext
    {
        public HMSDbContext(DbContextOptions<HMSDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {

            builder.Entity<Student>(i => i.ToTable("Student", "Hms"));
            builder.Entity<Student>().HasKey(w => w.StudentId);

            builder.Entity<StudentResHallPref>(i => i.ToTable("Student_ResHall_Pref", "Hms"));
            builder.Entity<StudentResHallPref>().HasNoKey();


            builder.Entity<ResHallMaster>(i => i.ToTable("Res_Hall_Master", "Hms"));
            builder.Entity<ResHallMaster>().HasKey(w => w.ResHallId);

            builder.Entity<RoomMaster>(i => i.ToTable("Room_Master", "Hms"));
            builder.Entity<RoomMaster>().HasKey(w => w.RoomId);

            builder.Entity<BedMaster>(i => i.ToTable("Bed_Master", "Hms"));
            builder.Entity<BedMaster>().HasKey(w => w.BedId);
            builder.Entity<StudentResidentAllocation>(i => i.ToTable("Student_Resident_Allocation", "HMS"));
            builder.Entity<StudentResidentAllocation>().HasKey(w => w.StudentResidentId);
            builder.Entity<StudentRoomAllotment>().HasNoKey();
            base.OnModelCreating(builder);
        }

        public async Task<StudentRoomAllotment> AssignStudentResident(StudentResHallPref studentResHallPref)
        {
            var data = await Set<StudentRoomAllotment>()
               .FromSqlRaw("EXEC [HMS].[usp_AllocateStudentResident] {0},{1},{2},{3},{4}",
               studentResHallPref?.StudentId, studentResHallPref?.RoomMateId, studentResHallPref?.Gender, studentResHallPref?.EmailId, studentResHallPref?.RoomPrefType).ToListAsync();

            return data?.FirstOrDefault();
        }


        public async Task<List<StudentRoomAllotment>> GetAllStudnetRoomAllotments()
        {
            var data = await Set<StudentRoomAllotment>()
               .FromSqlRaw("EXEC [HMS].[usp_GetAllAllocateStudentResident] "
               ).ToListAsync();

            return data;
        }


        public DbSet<Student> Students { get; set; }

        public DbSet<Student> StudentResidentPreferences { get; set; }

        public DbSet<ResHallMaster> ResidentHalls { get; set; }

        public DbSet<RoomMaster> Rooms { get; set; }

        public DbSet<BedMaster> Beds { get; set; }

        public DbSet<StudentResidentAllocation> StudentResidentAllocations { get; set; }
    }
}
