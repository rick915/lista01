use db_atividade_view;

#1
CREATE VIEW vw_alunos_disciplina AS
SELECT aluno.nome aluno_nome, disciplina.nome disciplina_nome, curso.nome curso_nome
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
INNER JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina
INNER JOIN curso ON disciplina.id_curso = curso.id_curso;

#2
CREATE VIEW total_alunos_disciplina AS
SELECT disciplina.nome disciplina_nome, aluno.nome aluno_nome
FROM disciplina
INNER JOIN matricula ON disciplina.id_disciplina = matricula.id_disciplina
INNER JOIN aluno ON matricula.id_aluno = aluno.id_aluno;

#3
CREATE VIEW alunos_status_matricula AS
SELECT aluno.nome aluno_nome, disciplina.nome disciplina_nome, matricula.status
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
INNER JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina;

#4
CREATE VIEW professores_turmas AS 
SELECT professor.nome professor_nome, disciplina.nome disciplina_nome, turma.horario
FROM professor
INNER JOIN turma ON professor.id_professor = turma.id_professor
INNER JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina;

#5
CREATE VIEW alunos_maiores_20 AS 
SELECT nome aluno_nome, data_nascimento data_nasc_aluno
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
WHERE data_nascimento = > 20 YEAR;

#6
CREATE VIEW disciplinas_carga_horaria_curso AS 
SELECT curso.nome curso_nome, disciplina.nome disciplina_nome, curso.carga_horaria
FROM curso
INNER JOIN disciplina ON curso.id_curso = disciplina.id_curso;

#7
CREATE VIEW professores_especialidades AS
SELECT nome professor_nome, especialidade especialidade_professor
FROM professor
INNER JOIN turma ON professor.id_professor = turma.id_professor
INNER JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina;

#8
CREATE VIEW alunos_multidisciplinas AS
SELECT aluno.nome aluno_nome, disciplina.nome disciplina_nome
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
INNER JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina
GROUP BY aluno.id_aluno
WHERE disciplina = >1;

#9
CREATE VIEW alunos_disciplinas_concluidas AS
SELECT aluno.nome aluno_nome, disciplina.nome disciplina_nome
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
INNER JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina
WHERE matricula.status = 'Concluído';

#10
CREATE VIEW turmas_semestre AS
SELECT turma.id_turma, disciplina.nome disciplina_nome, turma.semestre, turma.horario
FROM turma
INNER JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina
WHERE turma.semestre = '2024.1';

#11
CREATE VIEW alunos_matriculas_trancadas AS
SELECT aluno.nome aluno_nome
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
WHERE matricula.status = 'Trancado';

#12
CREATE VIEW disciplinas_sem_alunos AS
SELECT disciplina.nome disciplina_nome
FROM disciplina
LEFT JOIN matricula ON disciplina.id_disciplina = matricula.id_disciplina
WHERE matricula.id_aluno;

#13
CREATE VIEW alunos_status AS
SELECT matricula.status, aluno.nome aluno_nome
FROM matricula
INNER JOIN aluno ON matricula.id_aluno = aluno.id_aluno;

#14
CREATE VIEW total_professores_especialidade AS
SELECT professor.nome professor_nome, professor.especialidade
FROM professor
INNER JOIN turma ON professor.id_professor = turma.id_professor;

#15
CREATE VIEW lista_alunos_idades AS
SELECT nome.aluno aluno_nome, data_nascimento.aluno data_nasc_aluno
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno;

#16
CREATE VIEW alunos_ultimas_matriculas AS
SELECT aluno.nome aluno_nome, matricula.data_matricula matricula_data
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
GROUP BY aluno.id_aluno;

#17
CREATE VIEW disciplinas_curso_especifico AS
SELECT disciplina.nome disciplina_nome, curso.nome curso_nome
FROM disciplina
INNER JOIN curso ON disciplina.id_curso = curso.id_curso
WHERE curso.nome = 'Engenharia de Software';

#18
CREATE VIEW professores_sem_turmas AS 
SELECT professor.nome professor_nome
FROM professor
LEFT JOIN turma ON professor.id_professor = turma.id_professor
WHERE turma.id_turma;

#19
CREATE VIEW lista_alunos_cpf_email AS 
SELECT nome aluno_nome, cpf aluno_cpf, email aluno_email
FROM aluno
INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno;

#20
CREATE VIEW total_disciplinas_professor AS 
SELECT professor.nome professor_nome, disciplina.nome disciplina_nome
FROM professor
INNER JOIN turma ON professor.id_professor = turma.id_professor
INNER JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina;
