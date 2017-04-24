import React, { Component } from 'react';
import Reviews from "./Reviews";
import Form from "./Form";

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
    reviews: [],
    value: ''
  };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSubmit(event){
    event.preventDefault();
    let eventId = parseInt(document.getElementById('reviewList').dataset.id);
    let newReviews = [];
    fetch(
      `/api/v1/taco_shops/${tacoShopId}/reviews`,
      {
        credentials: 'same-origin',
        method: 'post',
        body: JSON.stringify({ body: this.state.value, taco_shop_id: tacoShopId })
      }
    ).then((response) => {
      return response.json();
    }).then((newReviews) => {
      this.setState({
        reviews: newReviews,
      });
      $(".review-input")[0].value = "";
    });
  }

  componentDidMount() {
    let eventId = parseInt(document.getElementById('reviewList').dataset.id);
    $.ajax({
      method: "GET",
      url: `../api/v1/taco_shops/${tacoShopId}.json`,
    }).done(data => {
      this.setState({
        reviews: data.reviews
      });
    });
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      let currentUserId = parseInt(document.getElementById('currentUser').dataset.id);
      return(
        <Reviews
        key={review.id}
        id={review.id}
        eventId={review.event_id}
        body={review.body}
        showEditLink={ (currentUserId === review.user_id) ? true: false} />
      );
    });
    return (
      <div>
        <h2 className="review-form-title">Add a Review</h2>
        <Form
          handleSubmit={this.handleSubmit}
          handleChange={this.handleChange}
        />
        <h2 className="reviews-list-title">Reviews</h2>
        {reviews.length === 0 ? <span className="first-review">Be the first to review!</span> : reviews}
      </div>
    );
  }
}

export default ReviewList;
