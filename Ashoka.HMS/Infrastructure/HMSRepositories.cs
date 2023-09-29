using Ashoka.HMS.EFCore;
using Ashoka.HMS.Entities;
using Microsoft.EntityFrameworkCore;

namespace Ashoka.HMS.Infrastructure
{

    public interface IHMSRepositories
    {
        public Task<List<Student>> GetStudents();

        public Task<Student> AddStudent(Student student);

        public Task AddRandomStudents();
        public Task<Student> GetStudentDetail(int? studentId);


        public Task<List<ResHallMaster>> GetAllResidents();

        public Task<List<RoomMaster>> GetAllRooms();

        public Task<List<BedMaster>> GetAllBeds();

        public Task<StudentRoomAllotment> AssignStudentResident(StudentResHallPref studentResHallPref);

        public Task<List<StudentRoomAllotment>> GetAllStudnetRoomAllotments();

    }

    public class HMSRepositories : IHMSRepositories
    {
        readonly HMSDbContext _dbContext;
        public HMSRepositories(HMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task AddRandomStudents()
        {
            List<Student> students = new List<Student>();
            for (int i = 2; i < 100; i++)
            {
                string name = "stud" + i;
                Student student = new Student { EmailId = name +"@mail.com", Name = name };
                if (i%2==0)
                {
                    student.Gender = "female";
                }
                else
                {
                    student.Gender = "male";
                }
                students.Add(student);
               
            }

            await _dbContext.Students.AddRangeAsync(students);
            _dbContext.SaveChanges();
        }

        public async Task<Student> AddStudent(Student student)
        {
             await _dbContext.Students.AddAsync(student);
            _dbContext.SaveChanges();
            return student;
        }

        public async Task<StudentRoomAllotment> AssignStudentResident(StudentResHallPref studentResHallPref)
        {
           var data= await _dbContext.AssignStudentResident(studentResHallPref);
            return data;
        }

        public async Task<List<BedMaster>> GetAllBeds()
        {
            var residents = await _dbContext.Beds.ToListAsync();
            return residents;
        }

        public async Task<List<ResHallMaster>> GetAllResidents()
        {
           var residents= await _dbContext.ResidentHalls.ToListAsync();
            return residents;
        }

        public async Task<List<RoomMaster>> GetAllRooms()
        {
            var rooms = await _dbContext.Rooms.ToListAsync();
            return rooms;
        }

        public async Task<Student> GetStudentDetail(int? studentId)
        {
            var students = await _dbContext.Students.FirstOrDefaultAsync(w=>w.StudentId==studentId);
            return students;
        }

      
        public async Task<List<Student>> GetStudents()
        {
            var students = await _dbContext.Students.ToListAsync();
            return students;
        }

        public async Task<List<StudentRoomAllotment>> GetAllStudnetRoomAllotments()
        {
            var data = await _dbContext.GetAllStudnetRoomAllotments();
            return data;
        }
    }
}
