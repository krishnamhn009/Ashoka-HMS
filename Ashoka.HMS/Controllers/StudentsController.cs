using Ashoka.HMS.Entities;
using Ashoka.HMS.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace Ashoka.HMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        IHMSRepositories _hMSRepositories;
        public StudentsController(IHMSRepositories hMSRepositories)
        {
            _hMSRepositories = hMSRepositories;
        }
        /// <summary>
        /// to seed student data
        /// </summary>
        /// <returns></returns>
        [HttpPost("seed-student")]
        public async Task<IActionResult> RegisterStudent()
        {
             await _hMSRepositories.AddRandomStudents();
            return Ok("student registered.");
        }

        /// <summary>
        /// register student
        /// </summary>
        /// <param name="student"></param>
        /// <returns></returns>
        [HttpPost("register-student")]
        public async Task<IActionResult> RegisterStudent([FromBody] Student student)
        {
            var data = await _hMSRepositories.AddStudent(student);
            return Ok(data);
        }
        /// <summary>
        /// list all students
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetStudents()
        {
            var data=await _hMSRepositories.GetStudents();
            return Ok(data);
        }
        /// <summary>
        /// get student details by Id
        /// </summary>
        /// <param name="studentId"></param>
        /// <returns></returns>
        [HttpGet("student-detail/{studentId}")]
        public async Task<IActionResult> GetStudentDetail([FromRoute]int? studentId)
        {
            if (studentId==null|| studentId==0)
            {
                return BadRequest("Invalid student Id");
            }
            var data = await _hMSRepositories.GetStudentDetail(studentId);
            return Ok(data);
        }

       /// <summary>
       /// get all resident details
       /// </summary>
       /// <returns></returns>
        [HttpGet("all-resident-details")]
        public async Task<IActionResult> GetAllResidents()
        {
            var data = await _hMSRepositories.GetAllResidents();
            return Ok(data);
        }
        /// <summary>
        /// list all rooms
        /// </summary>
        /// <returns></returns>
        [HttpGet("all-rooms")]
        public async Task<IActionResult> GetAllRooms()
        {
            var data = await _hMSRepositories.GetAllRooms();
            return Ok(data);
        }
        /// <summary>
        /// list all beds
        /// </summary>
        /// <returns></returns>
        [HttpGet("all-beds")]
        public async Task<IActionResult> GetAllBeds()
        {
            var data = await _hMSRepositories.GetAllBeds();
            return Ok(data);
        }
        /// <summary>
        /// assign student resident with preference
        /// </summary>
        /// <param name="studentId"></param>
        /// <param name="studentResHallPref"></param>
        /// <returns></returns>
        [HttpPost("assign-student-resident/{studentId}")]
        public async Task<IActionResult> AssignStudentResident([FromRoute] int studentId,[FromBody] StudentResHallPref studentResHallPref)
        {
            if (studentResHallPref.StudentId != studentId)
                return BadRequest("Invalid student id");
            var data = await _hMSRepositories.AssignStudentResident(studentResHallPref);
            return Ok(data);
        }

        [HttpGet("all-room-allotment")]
        public async Task<IActionResult> GetAllStudnetRoomAllotments()
        {
            var data = await _hMSRepositories.GetAllStudnetRoomAllotments();
            return Ok(data);
        }


    }
}
