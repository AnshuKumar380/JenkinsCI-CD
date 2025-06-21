# django-todo-CICD

A complete end-to-end CI/CD pipeline setup for a Django Todo App using **Jenkins**, **Docker**, **GitHub**, and **Kubernetes**. This project demonstrates how to automate building, testing, containerizing, pushing to DockerHub, and deploying the application to Kubernetes clusters.

![todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)

---

## 🧰 Tech Stack

- **Backend Framework**: Django (Python)
- **Containerization**: Docker
- **Version Control**: Git + GitHub
- **CI/CD Tool**: Jenkins
- **Container Registry**: DockerHub
- **Orchestration**: Kubernetes
- **Cloud**: Minikube or any cloud-based K8s cluster

---

## 🚀 Project Features

- Django Todo Application
- Automated Docker Image Build via Jenkins
- Jenkinsfile to automate:
  - Cloning the code
  - Building Docker image
  - Pushing image to DockerHub
  - Updating and pushing Kubernetes deployment YAMLs
- Auto Deployment to Kubernetes
- GitHub Token used for secure push with `repo` and `workflow` scope

---

## 🛠️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/AnshuKumar380/JenkinsCI-CD.git
cd JenkinsCI-CD
```

### 2. Run the app locally (optional)

> Install dependencies

```bash
pip install django==3.2
```

> Create and apply migrations

```bash
python manage.py makemigrations
python manage.py migrate
```

> Create admin user

```bash
python manage.py createsuperuser
```

> Start local server

```bash
python manage.py runserver
```

Visit [http://127.0.0.1:8000/todos](http://127.0.0.1:8000/todos)

---

## ⚙️ Jenkins Pipeline Steps

1. Jenkins clones the GitHub repository (`JenkinsCI-CD`).
2. Builds the Docker image from `Dockerfile`.
3. Tags and pushes the image to DockerHub:  
   `anshukr1021/cicd-e2e:<BUILD_NUMBER>`
4. Clones the second GitHub repo: `K8S-Manifests`.
5. Updates the `deploy.yaml` file dynamically using `sed` to insert the new image tag.
6. Commits the updated manifest file and pushes it back to GitHub.
7. Kubernetes applies the updated manifest for deployment.

### 🔐 GitHub Token Scope Required

- `repo` ✔️ (Full control for pushing updates)
- `workflow` ✔️ (For GitHub Actions if used)
- `user:email` ✔️ (For identifying commit author)

---

## 📁 Directory Structure

```text
.
├── Jenkinsfile                 # CI/CD pipeline instructions
├── Dockerfile                 # Builds Python Django App
├── manage.py                  # Django project file
├── requirements.txt           # Python dependencies
├── todos/                     # Django app folder
└── K8S-Manifests/
    └── deploy.yaml            # Kubernetes deployment file
```

---

## 🐳 Docker Commands (manual test)

> Build Docker image locally

```bash
docker build -t anshukr1021/todo-app:v1 .
```

> Run container

```bash
docker run -p 8000:8000 anshukr1021/todo-app:v1
```

---

## ☸️ Kubernetes Setup

> Deploy to Minikube or cloud K8s:

```bash
kubectl apply -f deploy.yaml
```

> Check deployment

```bash
kubectl get pods
kubectl get svc
```

---

## ✅ Final Outcomes

- Full end-to-end automated CI/CD using Jenkins
- Dockerized Django app
- Kubernetes deployment automation
- GitHub token authentication for repo updates

---

## 🤝 Author

**Anshu Kumar**  
📫 GitHub: [AnshuKumar380](https://github.com/AnshuKumar380)

---
