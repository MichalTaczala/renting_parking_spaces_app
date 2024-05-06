package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/charge"
)

func main() {
	router := gin.Default()
	envFile, _ := godotenv.Read(".env")
	stripe.Key = envFile["STRIPE_PRIVATE_KEY"]
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "Hello, World!"})
	})
	router.POST("/handlePayments", func(c *gin.Context) {
		var request struct {
			ClientSecret string `json:"client_secret"`
		}
		if err := c.BindJSON(&request); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
			return
		}

		clientSecret := request.ClientSecret

		// Attempt to charge the customer
		ch, err := charge.New(params)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Can't create charge"})
			return
		}

		fmt.Printf("Charge ID: %s\n", ch.ID)
	})

	router.Run(":8080")

}
