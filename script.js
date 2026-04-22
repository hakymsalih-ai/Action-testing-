document.addEventListener('DOMContentLoaded', function() {
  let employees = [];
  let attendances = [];
  let leaves = [];
  let performances = [];

  function renderEmployees() {
    const tbody = document.getElementById('employeeTable');
    tbody.innerHTML = '';
    employees.forEach((emp, index) => {
      const row = document.createElement('tr');
      row.innerHTML = `<td>${emp.name}</td><td>${emp.email}</td><td><button class="delete" onclick="deleteEmployee(${index})">🗑️ حذف</button></td>`;
      tbody.appendChild(row);
    });
  }

  function renderAttendances() {
    const tbody = document.getElementById('attendanceTable');
    tbody.innerHTML = '';
    attendances.forEach((att, index) => {
      const row = document.createElement('tr');
      row.innerHTML = `<td>${att.employeeName}</td><td>${att.date}</td><td>${att.status}</td><td><button class="delete" onclick="deleteAttendance(${index})">🗑️ حذف</button></td>`;
      tbody.appendChild(row);
    });
  }

  function renderLeaves() {
    const tbody = document.getElementById('leaveTable');
    tbody.innerHTML = '';
    leaves.forEach((leave, index) => {
      const row = document.createElement('tr');
      row.innerHTML = `<td>${leave.employeeName}</td><td>${leave.date}</td><td>${leave.type}</td><td><button class="delete" onclick="deleteLeave(${index})">🗑️ حذف</button></td>`;
      tbody.appendChild(row);
    });
  }

  function renderPerformances() {
    const tbody = document.getElementById('performanceTable');
    tbody.innerHTML = '';
    performances.forEach((perf, index) => {
      const row = document.createElement('tr');
      row.innerHTML = `<td>${perf.employeeName}</td><td>${perf.rating}</td><td><button class="delete" onclick="deletePerformance(${index})">🗑️ حذف</button></td>`;
      tbody.appendChild(row);
    });
  }

  document.getElementById('employeeForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    if (name && email) { employees.push({ name, email }); renderEmployees(); this.reset(); }
  });

  document.getElementById('attendanceForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const employeeName = document.getElementById('employeeName').value.trim();
    const date = document.getElementById('date').value;
    const status = document.getElementById('status').value;
    if (employeeName && date) { attendances.push({ employeeName, date, status }); renderAttendances(); this.reset(); }
  });

  window.deleteEmployee = (index) => { employees.splice(index, 1); renderEmployees(); };
  window.deleteAttendance = (index) => { attendances.splice(index, 1); renderAttendances(); };
  window.deleteLeave = (index) => { leaves.splice(index, 1); renderLeaves(); };
  window.deletePerformance = (index) => { performances.splice(index, 1); renderPerformances(); };

  window.enterSystem = function() {
    document.getElementById('welcomeSection').style.display = 'none';
    document.getElementById('systemSection').style.display = 'block';
  };
});

