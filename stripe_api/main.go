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
	var tokenStripe string
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "Hello, World!"})
	})
	router.POST("/create-token", func(c *gin.Context) {
		var request struct {
			Token string `json:"token"`
		}
		if err := c.BindJSON(&request); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
			return
		}

		tokenStripe = request.Token
		params := &stripe.ChargeParams{
			Amount:       stripe.Int64(2000), // Charge amount is in cents (2000 cents = 20 USD)
			Currency:     stripe.String(string(stripe.CurrencyUSD)),
			Description:  stripe.String("Charge for parking space rental"),
			ReceiptEmail: stripe.String("customer@example.com"),
		}
		params.SetSource(tokenStripe) // Replace 'tok_visa' with a real token ID

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
