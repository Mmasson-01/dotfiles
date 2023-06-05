package main

func main() {
}

// user struct
type User struct {
	name string `json:"name" yaml:"name"`
}

func (u *User) GetName() string {
	return u.name
}

func (u *User) SetName(name string) {
}
